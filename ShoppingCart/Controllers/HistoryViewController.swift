//
//  HistoryViewController.swift
//  BaseTab
//
//  Created by Sophie Zhou on 11/22/17.
//  Copyright © 2017 Sophie Zhou. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    // Data store of past orders
    static var orders: [Order] = []
    let tableView = UITableView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.title = "History"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView stuff
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.frame.origin = CGPoint(x: 22, y: 28)
        self.tableView.frame.size = CGSize(width: 375, height: self.view.bounds.height)
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "OrderCell")
        
        if HistoryViewController.orders.count == 0 {
            self.tableView.isHidden = true
        } else {
            self.tableView.isHidden = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        if HistoryViewController.orders.count > 0 {
            self.tableView.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HistoryViewController.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderTableViewCell
        cell.configure(order: HistoryViewController.orders[indexPath.row])
        return cell
    }
}
