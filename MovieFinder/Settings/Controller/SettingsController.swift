//
//  SettingsController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/13/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import Firebase

class SettingsController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundColor
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        tableView.backgroundColor = UIColor.backgroundColor
        
        let cell = tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let titleAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        self.navigationItem.title = "Settings"
        
        navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension SettingsController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.accentColor
        cell.textLabel?.textColor = UIColor.titleTextColor
        
        switch(indexPath.section, indexPath.row) {
        case(0,0):
            cell.textLabel?.text = "Purchases"
        case(0,1):
            cell.textLabel?.text = "Bookmarks"
        case(1,0):
            cell.textLabel?.text = "Payment info"
        case(2,0):
            cell.textLabel?.text = "Logout"
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        navigationController?.pushViewController(loginController, animated: true)
    }
}
