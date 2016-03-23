//
//  AppDelegate.swift
//  CoreDataSample
//
//  Created by caizhili on 16/3/21.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //托管对象上下文
    var managedObjContext: NSManagedObjectContext?
    //托管对象模型
    var managedObjModel: NSManagedObjectModel?
    //持久化存储协调器
    var persistentStoreCoordinator: NSPersistentStoreCoordinator?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.managedObjContext = initManagedObjContext()
        self.managedObjModel = iniManagedObjModel()
        self.persistentStoreCoordinator = initPerStoreCoordinator()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.saveContext()
    }

    func saveContext() {
        let managedObjContext: NSManagedObjectContext? = self.managedObjContext
        //如果托管对象上下文包含了未保存的修改,执行保存，如果保存失败记录错误的谢谢
        if managedObjContext != nil {
            if ((managedObjContext?.hasChanges) != nil) {
                do {
                    try self.managedObjContext!.save()
                } catch let er as NSError {
                    print(er.userInfo)
                    abort()
                }
            }
        }
    }

    func initManagedObjContext() -> NSManagedObjectContext {
        //let one = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.)
        
        if self.managedObjContext != nil {
            return self.managedObjContext!
        }
        //获取持久化存储协调器
        let coordinator: NSPersistentStoreCoordinator? = self.initPerStoreCoordinator()
        if coordinator != nil {
            self.managedObjContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            //为NSManagedObjectContext对象设置持久化存储协调器
            self.managedObjContext?.persistentStoreCoordinator = coordinator
        }
        return self.managedObjContext!
    }
    
    //初始化托管对象
    func iniManagedObjModel() -> NSManagedObjectModel {
        if self.managedObjModel != nil {
            return self.managedObjModel!
        }
        //获取实体模型对应的NSURL
        let modelURL: NSURL = NSBundle.mainBundle().URLForResource("CoreDateModel", withExtension: "momd")!
        self.managedObjModel = NSManagedObjectModel(contentsOfURL: modelURL)
        
        return self.managedObjModel!
    }
    
    //返回应用的持久化存储协调器对象
    func initPerStoreCoordinator() -> NSPersistentStoreCoordinator {
        //
        if self.persistentStoreCoordinator != nil {
            return self.persistentStoreCoordinator!
        }
        //获取SQLite数据库文件的存储目录
        let storeURL: NSURL = self.applicationDocDir().URLByAppendingPathComponent("Books.sqlite")
        //以持久化对象模型为基础，创建NSPer..对象
        self.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.iniManagedObjModel())
        do {
            try self.persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch let er as NSError {
            print(er.userInfo)
            abort()
        }
        
        return self.persistentStoreCoordinator!
    }
    
    func applicationDocDir() -> NSURL {
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentationDirectory, inDomains: .UserDomainMask).last!
    }
    
}

