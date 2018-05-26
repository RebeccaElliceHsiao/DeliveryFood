//
//  Order.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/1/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class Order {
    
    var foodList: [Food]
    let deliverer: Profile
    var uniqueFoods : [Food] = []
    var foodAndQuantities : [String: Int] = [:]
    
    init(foodList: [Food], deliverer: Profile) {
        self.foodList = foodList
        self.deliverer = deliverer
    }
    
}

