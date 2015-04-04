//
//  CellPatientTableViewCell.swift
//  IntenseCare
//
//  Created by Bianca Letti on 22/03/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import UIKit

class CellPatientTableViewCell: UITableViewCell {

    var viewController:UIViewController? = nil
    
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientBed: UILabel!
    @IBOutlet weak var patientStatus: UIImageView!
    
    @IBAction func ExtraButton(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Choose an option", message: "Some Message" , preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let consultation = UIAlertAction(title: "Make consultation", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("consultation")
        }
        let history = UIAlertAction(title: "History", style: UIAlertActionStyle.Default) { (alert) -> Void in
            println("history")
        }
        let blabla = UIAlertAction(title: "Bla Bla", style: UIAlertActionStyle.Default) { (alert) -> Void in
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
    
    func setViewController(VC:UIViewController){
        self.viewController = VC
    }

}
