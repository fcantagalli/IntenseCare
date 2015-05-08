//
//  CellPatientTableViewCell.swift
//  IntenseCare
//
//  Created by Bianca Letti on 22/03/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import UIKit

class CellPatientTableViewCell: UITableViewCell {

    // attributes
    var viewController:UIViewController? = nil
    var patientId = 0
    
    // outlets
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientBed: UILabel!
    
    @IBAction func ExtraButton(sender: AnyObject) {
        
        let alert = UIAlertController(title: nil, message: nil , preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let consultation = UIAlertAction(title: "Do consultation", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("consultation")
            var storyboard = UIStoryboard(name: "Consultation", bundle: nil)
            var viewController:UITabBarController = storyboard.instantiateViewControllerWithIdentifier("Consultation") as! UITabBarController
            self.viewController?.navigationController?.pushViewController(viewController, animated: true)
        }
        let history = UIAlertAction(title: "Change bed", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("history")
        }
        let blabla = UIAlertAction(title: "Change status", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("Bla Bla")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert) -> Void in
            println("Cancel Pressed")
        }
        
        alert.addAction(consultation)
        alert.addAction(history)
        alert.addAction(blabla)
        alert.addAction(cancelButton)
        
        viewController?.presentViewController(alert, animated: true, completion: nil)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellViewController(VC:UIViewController){
        self.viewController = VC
    }

}
