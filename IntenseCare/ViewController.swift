//
//  ViewController.swift
//  Test
//
//  Created by Bianca Letti on 07/03/15.
//  Copyright (c) 2015 Bianca Letti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    //var myred = self.RGBColor(230.0,76.0,101.0,1.0)
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var cellContent=["Felipe", "Bianca","Luciano"]
    var ageContent=["23", "21", "43"]
    var bedContent=["34","45","143"]
    
    var tableContent:JSON!
    
    let green = UIColor(red: 17, green: 168, blue: 171, alpha: 1)
    let orange = UIColor(red: 252, green: 177, blue: 80, alpha: 1)
    
    @IBAction func addPatient(sender: AnyObject) {
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = storyboard.instantiateViewControllerWithIdentifier("InsertPatient") as! UIViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this method goes first before inserting rows
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        var postVar = "hospital_id=1"
        tableContent = WebServiceResource.getWebContent(WebServiceResource.GET_PATIENT_BY_HOSPITAL_ID, postVariables: postVar)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        //return tableContent.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println(cellContent.count)
        return (cellContent.count-1)
    }
    
   /* func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var headerView = UIView()
        headerView.backgroundColor = UIColor.whiteColor()
        return headerView
    }*/
    
   /* func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }*/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("table")
        
        var cell = tableView.dequeueReusableCellWithIdentifier("PatCell", forIndexPath: indexPath) as! CellPatientTableViewCell
        
        applyShadowOnCell(cell)
        
        cell.setCellViewController(self)
        cell.patientId = tableContent[indexPath.section]["patient_id"].intValue
       // cell.patientName.text = cellContent[indexPath.section]
        cell.patientName.text = tableContent[indexPath.section]["name"].stringValue
        //cell.patientAge.text = ageContent[indexPath.section]
        cell.patientAge.text = tableContent[indexPath.section]["birth"].stringValue
        //cell.patientBed.text = bedContent[indexPath.section]
        cell.patientBed.text = tableContent[indexPath.section]["bed"].stringValue
        
        if (cell.patientName.text=="Felipe") {
            cell.contentView.backgroundColor = UIColorFromHex("E64C65", 1.0)
        }
        else if(indexPath.section==2) {
            cell.contentView.backgroundColor = UIColorFromHex("3468AF", 1.0)
        }
        else{
            cell.contentView.backgroundColor = UIColorFromHex("FCB150", 1.0)
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applyShadowOnCell(cell:UITableViewCell){
        
        var shadowFrame = cell.layer.bounds
        var shadowPath = UIBezierPath(rect: shadowFrame)
        cell.layer.shadowPath = shadowPath.CGPath;
        
        cell.layer.shadowOffset = CGSizeMake(7, 7)
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowRadius = 7
        cell.layer.shadowOpacity = 0.5

    }
    
}

