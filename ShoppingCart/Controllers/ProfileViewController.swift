//
//  CViewController.swift
//  BaseTab
//
//  Created by Sophie Zhou on 11/22/17.
//  Copyright © 2017 Sophie Zhou. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {

    var profile = Profile(image: #imageLiteral(resourceName: "allen"), name: "Kobe Bryant", address: "123 Main St")
    var tableView = UITableView()
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.title = "Profile"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.backgroundView.layer.borderWidth = 0.5
        self.profileImage.image = self.profile.image
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.width / 2.0
        self.profileImage.clipsToBounds = true
        self.nameLabel.text = self.profile.name
        self.addressLabel.text = self.profile.address
        
        // TableView stuff
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.frame = CGRect(x: 20,
                                      y: self.backgroundView.frame.maxY + 30,
                                      width: self.view.bounds.width,
                                      height: 150)
        self.tableView.rowHeight = 45
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ProfileCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileTableViewCell

        if indexPath.row == 0 {
            cell.configure(icon: #imageLiteral(resourceName: "heart-icon"), text: "Your Favorites")
        } else if indexPath.row == 1 {
            cell.configure(icon: #imageLiteral(resourceName: "payment-icon"), text: "Payment")
        } else if indexPath.row == 2 {
            cell.configure(icon: #imageLiteral(resourceName: "help-icon"), text: "Help")
        }
        
        return cell
    }
}
