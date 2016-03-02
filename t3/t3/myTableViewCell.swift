//
//  myTableViewCell.swift
//  t3
//
//  Created by caizhili on 16/3/2.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var m_Label: UILabel!
    
    @IBOutlet weak var m_ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
