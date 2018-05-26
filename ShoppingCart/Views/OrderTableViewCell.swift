//
//  OrderTableViewCell.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/1/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var quantity1: UILabel!
    @IBOutlet weak var item1: UILabel!
    @IBOutlet weak var quantity2: UILabel!
    @IBOutlet weak var item2: UILabel!
    @IBOutlet weak var delivererPicture: UIImageView!
    @IBOutlet weak var deliverer: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var viewReceiptButton: UIButton!
    @IBOutlet weak var getHelpButton: UIButton!
    @IBOutlet weak var line: UIView!
    
    @IBOutlet weak var quantityConstraintTop: NSLayoutConstraint!
    @IBOutlet weak var quantityConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var quantityConstraintBottom: NSLayoutConstraint!
    
    func configure(order: Order) {
        self.quantity2.isHidden = false
        self.item2.isHidden = false
        self.topImage.image = #imageLiteral(resourceName: "chipotle")
        self.icon.image = #imageLiteral(resourceName: "check")
        self.orderStatus.text = "Order Delivered"
        let food1Name = order.uniqueFoods[0].name
        self.quantity1.text = "\(order.foodAndQuantities[food1Name]!)"
        self.quantity1.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.quantity1.layer.borderWidth = 1.0
        self.item1.text = food1Name
        
        if order.foodAndQuantities.count > 1 {
            let food2Name = order.uniqueFoods[1].name
            self.item2.text = food2Name
            self.quantity2.text = "\(order.foodAndQuantities[food2Name]!)"
            self.quantity2.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.quantity2.layer.borderWidth = 1.0
        }
        
        if order.foodAndQuantities.count == 1 {
            self.quantity2.isHidden = true
            self.item2.isHidden = true
            self.quantityConstraintTop.constant = 0
            self.quantityConstraintHeight.constant = 0
        }
        
        self.delivererPicture.image = order.deliverer.image
        self.deliverer.text = "Your delivery by \(order.deliverer.name)"
        
        var orderTotal = 0.0
        for food in order.foodList {
            orderTotal += food.price
        }
        
        self.total.text = "Total: $\(orderTotal.format(f: "-0.2"))"
        
        self.viewReceiptButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.viewReceiptButton.layer.borderWidth = 1.0
        self.getHelpButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.getHelpButton.layer.borderWidth = 1.0
        self.line.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
