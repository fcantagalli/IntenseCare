//
//  HospitalListTableViewController.swift
//  IntenseCare
//
//  Created by Felipe on 4/25/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//
import Foundation
import UIKit

class HospitalList:UIViewController, UITableViewDelegate   {
    
    @IBOutlet weak var hospitalTV: UITableView!
    
    var tableContent:JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableContent = WebServiceResource.getWebContent(WebServiceResource.GET_HOSPITALS, postVariables: nil)
        
        //hospitalTV.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("HospitalCell") as! UITableViewCell

        cell.textLabel?.text = tableContent[indexPath.row]["name"].stringValue
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}