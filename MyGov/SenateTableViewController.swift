//
//  SenateTableViewController.swift
//  MyGov
//
//  Created by David Brown on 7/10/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class SenateTableViewController: UITableViewController {
    
    var senators: [Senator] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Alamofire.request("https://mygov-ecfe0.firebaseio.com/senators.json").responseJSON(completionHandler: {
            response in
            
            if let senatorsDictionary = response.result.value as? JSON {
                
                for (key, value) in senatorsDictionary {
                    
                    if let senatorDictionary = value as? JSON {
                        var senator = Senator(json: senatorDictionary)
                        senator?.key = key
                        self.senators.append(senator!)
                        self.tableView.reloadData()
                    }
                    
                }
                
            }
            
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return senators.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "senatorCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = senators[indexPath.row].stateName
        cell.detailTextLabel?.text = senators[indexPath.row].stateCode

        return cell
    }

}
