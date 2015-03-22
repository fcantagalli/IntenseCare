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
    var cellContent=["Felipe", "Bianca","Luciano"]
    var ageContent=["101", "21", "45"]
    var bedContent=["34","45","143"]
    
    
        let green = UIColor(red: 17, green: 168, blue: 171, alpha: 1)
        let orange = UIColor(red: 252, green: 177, blue: 80, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func UIColorFromHex (hex:String, alpha:CGFloat) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (countElements(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        var cell = tableView.dequeueReusableCellWithIdentifier("PatCell", forIndexPath: indexPath) as CellPatientTableViewCell
        
        cell.patientName.text = cellContent[indexPath.row]
        cell.patientAge.text = ageContent[indexPath.row]
        cell.patientBed.text = bedContent[indexPath.row]
        
        if (cell.patientName.text=="Felipe") {
            cell.patientStatus.backgroundColor = UIColorFromHex("E64C65", alpha: 1.0)
        }
        else if(indexPath.row==2) {
            cell.patientStatus.backgroundColor = UIColor.blueColor()
        }
        else{
            cell.patientStatus.backgroundColor = self.orange
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

