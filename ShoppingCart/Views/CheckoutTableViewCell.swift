//
//  CheckoutTableViewCell.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/5/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {

    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(food: Food, foodQuantity: [String: Int]) {
        self.quantity.text = "\(foodQuantity[food.name]!)"
        self.foodName.text = food.name
        self.priceLabel.text = "$\(food.price.format(f: "0.2"))"
        
        self.quantity.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.quantity.layer.borderWidth = 1.0
    }
}
