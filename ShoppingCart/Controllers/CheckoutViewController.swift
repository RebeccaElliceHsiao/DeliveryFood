//
//  CheckoutViewController.swift
//  TableViewDelivery
//
//  Created by Allen Miao on 3/4/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var grayLine: UIView!
    @IBOutlet weak var lowerGrayLine: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var tableviewPaddingConstraint: NSLayoutConstraint!
    
    let horizontalPadding : CGFloat = 10
    let verticalPadding : CGFloat = 10

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xButton.addTarget(self, action: #selector(xButtonPressed), for: .touchUpInside)
        self.placeOrderButton.addTarget(self, action: #selector(placeOrderPressed), for: .touchUpInside)
        
        // TableView stuff
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.frame = CGRect(x: self.view.bounds.minX + self.horizontalPadding,
                                      y: self.grayLine.frame.maxY + self.verticalPadding,
                                      width: self.view.bounds.width,
                                      height: 45)
        self.tableView.rowHeight = 45
        
        let nib = UINib(nibName: "CheckoutTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CheckoutCell")
        
        var cost = 0.0
        for food in OrderViewController.currentOrder.foodList {
            cost += food.price
        }
        
        self.totalCostLabel.text = "$\(cost.format(f: "0.2"))"
        self.grayLine.frame.origin = CGPoint(x: self.grayLine.frame.origin.x,
                                       y: self.tableView.frame.maxY)
        
        self.totalPriceLabel.text = "$\(cost.format(f: "0.2"))"
        self.totalPriceLabel.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideStuff(hide: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var tableFrame = self.tableView.frame
        tableFrame.size.height = self.tableView.contentSize.height
        self.tableView.frame = tableFrame
        self.tableviewPaddingConstraint.constant = self.tableView.contentSize.height + self.verticalPadding
        self.hideStuff(hide: false)
    }
    
    private func hideStuff(hide: Bool) {
        self.lowerGrayLine.isHidden = hide
        self.totalCostLabel.isHidden = hide
        self.totalLabel.isHidden = hide
    }
    
    @objc func xButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func placeOrderPressed() {
        // Appending the current order to a static property in HistoryVC that stores all orders that have been made
        HistoryViewController.orders.append(OrderViewController.currentOrder)

        OrderViewController.currentOrder = Order(foodList: [], deliverer: Profile(image: #imageLiteral(resourceName: "allen"), name: "Kobe Bryant", address: "123 Lakers St"))
        self.dismiss(animated:true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderViewController.currentOrder.uniqueFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CheckoutCell") as! CheckoutTableViewCell
        cell.configure(food: OrderViewController.currentOrder.uniqueFoods[indexPath.row],
                       foodQuantity: OrderViewController.currentOrder.foodAndQuantities)
        return cell
    }
    
}
