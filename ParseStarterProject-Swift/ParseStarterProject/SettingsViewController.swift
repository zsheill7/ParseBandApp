//
//  SettingsViewController.swift
//  Band App
//
//  Created by Zoe Sheill on 6/25/16.
//  Copyright © 2016 ClassroomM. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let marchingInstrumentsList = ["Flute", "Clarinet", "Bassoon", "Alto Saxophone", "Low Saxophone", "Trumpet", "Trombone", "Mellophone", "Sousaphone"]
    
    let concertInstrumentsList = ["Flute", "Oboe", "Clarinet", "Bassoon", "Alto Saxophone", "Low Saxophone", "Trumpet", "Trombone", "French Horn", "Tuba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return concertInstrumentsList.count
    }
    
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        print(concertInstrumentsList[indexPath.row])
        cell.textLabel?.text = concertInstrumentsList[indexPath.row]
        
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
