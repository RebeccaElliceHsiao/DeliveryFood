//
//  Food.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/1/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

struct Food {
    
    let name: String
    let description: String
    let image: UIImage
    let price: Double
}

// Food items
let pepperoniPizza = Food(name: "Pepperoni Pizza", description: "One slice of pizza with fresh mozarella and pepperoni slices", image: #imageLiteral(resourceName: "pizza"), price: 8.00)
let shawarma = Food(name: "Shawarma", description: "Slices of lamb and beef seasoned with Mediterranean spices. Served with your choice of side.", image: #imageLiteral(resourceName: "shawarma"), price: 11.99)
let padThai = Food(name: "Pad Thai", description: "Traditional Thai style pan fried rice noddle, egg, peanut with your choice of protein", image: #imageLiteral(resourceName: "pad-thai"), price: 12.95)
let acaiBowl = Food(name: "Classic Acai Berry Bowl", description: "Pure unsweetened acai, house-made almond milk, blueberry and bananas.", image: #imageLiteral(resourceName: "acai-bowl"), price: 11.45)
let avocadoToast = Food(name: "Avocado Toast", description: "Avocado, microgreens, black sesame seeds and gluten free bread", image: #imageLiteral(resourceName: "avocado-toast"), price: 8.99)
