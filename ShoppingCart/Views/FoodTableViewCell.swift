//
//  FoodTableViewCell.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/2/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodPicture: UIImageView!
    
    func configure(food: Food) {
        self.foodLabel.text = food.name
        self.descriptionLabel.text = food.description
        self.priceLabel.text = "$\(food.price.format(f: "0.2"))"
        self.foodPicture.image = food.image
    }
    
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
