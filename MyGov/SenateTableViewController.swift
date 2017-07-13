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
    var myIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
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
        let name1 = senators[indexPath.row].firstName
        let namespace = " "
        let name2 = senators[indexPath.row].lastName
        
        var fullName = name1! + namespace + name2!

        // Trying to use this to indicate party by manipulating string
        if senators[indexPath.row].senateParty == "republican" {
            fullName = name1! + namespace + name2! + " (R)"
        } else {
           fullName = name1! + namespace + name2! + " (D)"
        }
       
        print(fullName)
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = senators[indexPath.row].stateName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
       
        print("this works")
        
        performSegue(withIdentifier: "segue1", sender: self)
        
    }

}
