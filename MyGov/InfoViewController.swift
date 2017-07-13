//
//  InfoViewController.swift
//  MyGov
//
//  Created by David Brown on 7/10/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class InfoViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("https://mygov-ecfe0.firebaseio.com/senators.json").responseJSON(completionHandler: {
            response in
            
            if let senatorsDictionary = response.result.value as? JSON {
                
                for (key, value) in senatorsDictionary {
                    
                    if let senatorDictionary = value as? JSON {
                        var senator = Senator(json: senatorDictionary)
                        senator?.key = key
                        //self.senators.append(senator!)
                        //self.tableView.reloadData()
                    }
                    
                }
                
            }
            
        })
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
