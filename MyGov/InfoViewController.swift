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
import MessageUI

class InfoViewController: UIViewController, MFMailComposeViewControllerDelegate {

   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    
//    view.backgroundColor = UIColor.cyan

    
    var senator: Senator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var senators: [Senator] = []

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
        
        
        if senator?.senateParty == "republican" {
            view.backgroundColor = UIColor.red
        } else if senator?.senateParty == "democrat" {
            view.backgroundColor = UIColor.cyan
        } else {
            view.backgroundColor = UIColor.yellow
        }

        
        nameLabel.text = (senator?.firstName)! + " " + (senator?.lastName)!
        stateLabel.text = senator?.stateName
      
     
        
        /* CUSTOM COLORS PASED ON SENATE PARTY
        
        if senator?.senateParty == "republican" {
            partyLabel.text = "Republican"
        } else if senator?.senateParty == "democrat" {
            partyLabel.text = "Democrat"
        } else {
            partyLabel.text = senator?.senateParty
        }
 */

        
        //nameView.text = senator?.firstName
        print(senator?.firstName)

        // Do any additional setup after loading the view.
    }

   @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError() 
        }
        
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["dbrown19@cmc.edu"])
        mailComposerVC.setSubject("Hello")
        mailComposerVC.setMessageBody("How're you doing", isHTML: false)
        
        return mailComposerVC
        
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device won't send", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
