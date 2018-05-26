//
//  ProfileTableViewCell.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/1/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var textL: UILabel!
    
    func configure(icon: UIImage, text: String) {
        self.icon.image = icon
        self.textL.text = text
    }
}
