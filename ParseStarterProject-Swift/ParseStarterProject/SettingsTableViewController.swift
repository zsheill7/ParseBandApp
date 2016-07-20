//
//  SettingsTableViewController.swift
//  ParseBandApp
//
//  Created by Zoe Sheill on 7/18/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class SettingsTableViewController: UITableViewController {


    @IBOutlet var table: UITableView!
   
    @IBOutlet weak var marchingInstCell: UITableViewCell!
    
    @IBOutlet weak var concertInstCell: UITableViewCell!
     @IBOutlet weak var ensembleTypeCell: UITableViewCell!
    
    @IBOutlet weak var marchingInst: UILabel!
    
    @IBOutlet weak var concertInst: UILabel!

    
    @IBOutlet weak var ensemble: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test1")
        if let marchingInst = PFUser.currentUser()!["marchingInstrument"] as? String {
            print("test2")
            self.marchingInst.text! = marchingInst
        }
        
        if let concertInst = PFUser.currentUser()!["concertInstrument"] as? String {
            print("test2")
            self.concertInst.text! = concertInst
        }
        if let ensemble = PFUser.currentUser()!["ensemble"] as? String {
            print("test2")
            self.ensemble.text! = ensemble
        }
        /*marchingInstCell.tag = 1
        concertInstCell.tag = 2
        ensembleTypeCell.tag = 3*/
        
        var frame: CGRect = table.frame;
        frame.size.height = table.contentSize.height
        table.frame = frame
        
    }
    
    override func viewDidAppear(animated: Bool) {
     
        
        if let marchingInst = PFUser.currentUser()!["marchingInstrument"] as? String {
            
            self.marchingInst.text! = marchingInst
        }
        
        if let concertInst = PFUser.currentUser()!["concertInstrument"] as? String {

            self.concertInst.text! = concertInst
        }
        if let ensemble = PFUser.currentUser()!["ensemble"] as? String {
            print("test3")
            self.ensemble.text! = ensemble
        }
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue_one" {
            let tableVC: SettingsInstrumentsTableViewController = segue.destinationViewController as! SettingsInstrumentsTableViewController
            
            tableVC.cellTag = 1
            tableVC.title = "Marching Instrument"
            
        } else if segue.identifier == "segue_two" {
            let tableVC: SettingsInstrumentsTableViewController = segue.destinationViewController as! SettingsInstrumentsTableViewController
            
            tableVC.cellTag = 2
            tableVC.title = "Concert Instrument"
            
        } else if segue.identifier == "segue_three" {
            let tableVC: SettingsInstrumentsTableViewController = segue.destinationViewController as! SettingsInstrumentsTableViewController
            
            tableVC.cellTag = 3
            tableVC.title = "Concert Band"
            
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor(red: 151.0/255, green: 193.0/255, blue: 100.0/255, alpha: 1)
        
    }
    
    
}
