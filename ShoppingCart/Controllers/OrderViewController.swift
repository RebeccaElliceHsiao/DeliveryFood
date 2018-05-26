//
//  AViewController.swift
//  BaseTab
//
//  Created by Sophie Zhou on 11/22/17.
//  Copyright © 2017 Sophie Zhou. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static var currentOrder = Order(foodList: [], deliverer: Profile(image: #imageLiteral(resourceName: "allen"), name: "Kobe Bryant", address: "123 Lakers St"))
    
    var menu : [Food] = [pepperoniPizza, shawarma, padThai, acaiBowl, avocadoToast]
    let tableView = UITableView()
    var button = UIButton()
    var orderTotal = UILabel()
    var orderQuantity = UILabel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.title = "Order"
        
        /* Give tab bar labels some vertical offset
         https://stackoverflow.com/questions/13618268/is-there-a-way-to-change-the-text-position-in-uitabbar-or-uitabbaritem
         */
        UITabBarItem.appearance().titlePositionAdjustment.vertical = -18
        
        /* Change the font and font size of tab bar item
         https://stackoverflow.com/questions/26069334/changing-tab-bar-font-in-swift
         */
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name:"GothamPro", size: 16) as Any], for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView stuff
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.frame = CGRect(x: 30, y: 28,
                                      width: 333,
                                      height: self.view.bounds.height)
        self.tableView.rowHeight = 130
        
        let nib = UINib(nibName: "FoodTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "FoodCell")
        
        self.view.addSubview(self.button)
        self.button.backgroundColor = #colorLiteral(red: 0.6024175286, green: 0.8327640295, blue: 0.3386053145, alpha: 1)
        self.button.addTarget(self, action: #selector(cartButtonPressed), for: .touchUpInside)
        self.button.isHidden = true
        
        self.view.addSubview(self.orderTotal)
        self.orderTotal.isHidden = true
        self.view.addSubview(self.orderQuantity)
        self.orderQuantity.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        self.button.frame = CGRect(x: 0, y: 630, width: self.view.bounds.width, height: 53)
        self.button.setTitle("VIEW CART", for: .normal)
        self.button.setTitleColor(UIColor.white, for: .normal)
        self.button.titleLabel?.font = UIFont(name:"GothamPro-Bold", size: 16)
        
        self.orderTotal.frame = CGRect(x: 20, y: 648, width: 75, height: 15)
        self.orderTotal.font = UIFont(name:"GothamPro-Medium", size: 16)
        self.orderTotal.textColor = UIColor.white
        
        self.orderQuantity.frame = CGRect(x: 365, y: 644, width: 25, height: 25)
        self.orderQuantity.font = UIFont(name:"GothamPro-Medium", size: 16)
        self.orderQuantity.textColor = UIColor.white
        self.orderQuantity.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.orderQuantity.layer.borderWidth = 2.0
        self.orderQuantity.textAlignment = NSTextAlignment.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if OrderViewController.currentOrder.foodList.count > 0 {
            self.button.isHidden = false
            self.orderTotal.isHidden = false
            self.orderQuantity.isHidden = false
            self.orderQuantity.text = "\(OrderViewController.currentOrder.foodList.count)"
            
            var currentTotal = 0.0
            for food in OrderViewController.currentOrder.foodList {
                currentTotal += food.price
            }
            self.orderTotal.text = "$\(currentTotal.format(f: "-0.2"))"
            self.orderTotal.sizeToFit()
        } else {
            self.button.isHidden = true
            self.orderTotal.isHidden = true
            self.orderQuantity.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodTableViewCell
        cell.configure(food: self.menu[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodDetailVC = FoodDetailViewController(food: self.menu[indexPath.row])
        self.present(foodDetailVC, animated: true, completion: nil)
    }
    
    @objc func cartButtonPressed() {
        let checkoutVC = CheckoutViewController()
        self.present(checkoutVC, animated: true, completion: nil)
    }
}

// https://gist.github.com/calt/7ea29a65b440c2aa8a1a
extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 58
        return sizeThatFits
    }
}
