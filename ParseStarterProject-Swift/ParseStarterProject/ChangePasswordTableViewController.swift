//
//  ChangePasswordTableViewController.swift
//  ParseBandApp
//
//  Created by Zoe Sheill on 7/18/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse
import Answers

class ChangePasswordTableViewController: UITableViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var user = PFUser.currentUser()
    
    func displayAlert(title: String, message: String) {
        
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                
            })))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            print("error")
        }
        
        
        
    }
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var oldPasswordField: UITextField!
    
    @IBOutlet weak var newPasswordField: UITextField!
    
    @IBAction func confirmButton(sender: AnyObject) {
        
        
        
        if oldPasswordField.text == "" || newPasswordField.text == "" || confirmPasswordField.text == "" {
            
            displayAlert("Error", message: "Please enter your old and new passwords")
            
        } else if newPasswordField.text!.characters.count < 5 {
            self.displayAlert("Not Long Enough", message: "Please enter a password that is 5 or more characters")
        } else if newPasswordField.text != confirmPasswordField.text {
            self.displayAlert("Passwords Do Not Match", message: "Please re-enter passwords")
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            user!.password = newPasswordField.text!
            
            user!.saveInBackground()
            
            if #available(iOS 8.0, *) {
                let alert = UIAlertController(title: "Success!", message: "Your password has been changed", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.performSegueWithIdentifier("passToSettings", sender: self)
                    
                })))
                
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                print("error")
            }
        }
        
        
    }
    
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        confirmButton.addTarget(self, action: #selector(self.userActionPasswordChanged), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func userActionPasswordChanged() {
        
        // TODO: Move this method and customize the name and parameters to track your key metrics
        //       Use your own string attributes to track common values over time
        //       Use your own number attributes to track median value over time
        Answers.logCustomEventWithName("Password Changed", customAttributes: ["Category":"User Settings", "Date":NSDate()])
    }
    
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor(red: 151.0/255, green: 193.0/255, blue: 100.0/255, alpha: 1)
        
    }
}
