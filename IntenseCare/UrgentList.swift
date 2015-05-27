//
//  UrgentList.swift
//  IntenseCare
//
//  Created by Felipe on 5/23/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class UrgentList:UIViewController,UITableViewDelegate {
    
    var nameContent = ["Hosp1","Hosp2","Hosp3"]
    var patContent = ["Felipe", "Bianca", "Luciano"]
    var sofaContent = ["5","10","15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this method goes first before inserting rows
        
        if self.revealViewController() != nil {
            //menuButton.target = self.revealViewController()
            //menuButton.action = "revealToggle:"
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        //return tableContent.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("table")
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CellHomeTableViewCell", forIndexPath: indexPath) as! CellHomeTableViewCell
        
        cell.hospitalName.text = nameContent[indexPath.row]
        cell.PatientName.text = patContent[indexPath.row]
        cell.SOFAValue.text = sofaContent[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}