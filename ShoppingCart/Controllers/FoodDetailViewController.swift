//
//  FoodDetailViewController.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/2/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    var food: Food
    
    @IBOutlet weak var bigFoodPic: UIImageView!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    init(food: Food) {
        self.food = food
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bigFoodPic.image = self.food.image
        self.foodName.text = self.food.name
        self.foodDescription.text = self.food.description
        self.priceLabel.text = "$\(self.food.price.format(f: "0.2"))"
        
        self.xButton.addTarget(self, action: #selector(xButtonPressed), for: .touchUpInside)
        self.addToCartButton.addTarget(self, action: #selector(addToCartButtonPressed), for: .touchUpInside)
    }

    @objc func xButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addToCartButtonPressed() {
        // Record the food name and the corresponding number of times that food has been ordered in a dictionary property of currentOrder
        if let foodQuantity = OrderViewController.currentOrder.foodAndQuantities[food.name] {
            OrderViewController.currentOrder.foodAndQuantities[self.food.name] = foodQuantity + 1
        } else {
            OrderViewController.currentOrder.foodAndQuantities[self.food.name] = 1
            OrderViewController.currentOrder.uniqueFoods.append(food)
        }
        OrderViewController.currentOrder.foodList.append(self.food)
        self.dismiss(animated: true, completion: nil)
    }
}

