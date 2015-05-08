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
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var hospitalTV: UITableView!
    
    @IBAction func AddHospital(sender: AnyObject) {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = storyboard.instantiateViewControllerWithIdentifier("InsertHospital") as! UIViewController
        //self.presentViewController(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
       // self.navigationItem.title = ""
    }
    
    var tableContent:JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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