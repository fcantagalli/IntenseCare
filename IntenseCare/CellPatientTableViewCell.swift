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
        // BUTTON TO DO THE CONSULTATION
        let consultation = UIAlertAction(title: "Do consultation", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("consultation")
            var storyboard = UIStoryboard(name: "Consultation", bundle: nil)
            let tabViewController:ConsultationTabsController = storyboard.instantiateViewControllerWithIdentifier("Consultation") as! ConsultationTabsController
            tabViewController.patientName = self.patientName.text!
            tabViewController.barColor = self.contentView.backgroundColor
            self.viewController?.showViewController(tabViewController, sender: self.viewController)
        }
        // BUTTON TO CHANGE PATIENT BED. It creates a alertView with a textfield for input, a save and canecel button.
        let changeBed = UIAlertAction(title: "Change bed", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("changing bed")
            
            var alertview = UIAlertController(title: "Chaging bed number for patient "+self.patientName.text!, message: "Insert the new bed number", preferredStyle: UIAlertControllerStyle.Alert)
            var saveButton = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: { (sender:UIAlertAction!) -> Void in
                // code to save
            })
            var cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            alertview.addTextFieldWithConfigurationHandler({ (textfield:UITextField!) -> Void in
                textfield.placeholder = "Insert new bed number here"
            })
            alertview.addAction(saveButton)
            alertview.addAction(cancelButton)
            self.viewController?.presentViewController(alertview, animated: false, completion: nil)
        }
        // BUTTON TO CHANGE PATIENT STATUS. It creates a alertView with a textfield for input, a save and canecel button.
        let changeStatus = UIAlertAction(title: "Change status", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("changing status")
            
            var alertview = UIAlertController(title: "Chaging status for patient "+self.patientName.text!, message: "Insert the new patient status", preferredStyle: UIAlertControllerStyle.Alert)
            var saveButton = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: { (sender:UIAlertAction!) -> Void in
                // code to save
            })
            var cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            alertview.addTextFieldWithConfigurationHandler({ (textfield:UITextField!) -> Void in
                textfield.placeholder = "Insert new status number here"
            })
            alertview.addAction(saveButton)
            alertview.addAction(cancelButton)
            self.viewController?.presentViewController(alertview, animated: false, completion: nil)

        }
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert) -> Void in
            println("Cancel Pressed")
        }
        
        alert.addAction(consultation)
        alert.addAction(changeBed)
        alert.addAction(changeStatus)
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
