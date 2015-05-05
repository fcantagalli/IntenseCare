//
//  InsertHospital.swift
//  IntenseCare
//
//  Created by Felipe on 5/5/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation
import UIKit

class InsertHospital:UIViewController, UITextFieldDelegate {
    
    //OUTLETS TO ACCESS THE FORM
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var address1TF: UITextField!
    @IBOutlet weak var address2TF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var bedsTF: UITextField!
    
    
    // ACTION BUTTON TO SAVE
    @IBAction func saveButton(sender: AnyObject) {
        //CODE TO SAVE HERE
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myWhite = UIColor(white: 1, alpha: 0.2)
        
        // set Placeholder text and color for name text field
        nameTF.attributedPlaceholder = NSAttributedString(string:" Name",
            attributes:[NSForegroundColorAttributeName: myWhite])
        address1TF.attributedPlaceholder = NSAttributedString(string:" Address Line 1",
            attributes:[NSForegroundColorAttributeName: myWhite])
        address2TF.attributedPlaceholder = NSAttributedString(string:" Address Line 2",
            attributes:[NSForegroundColorAttributeName: myWhite])
        numberTF.attributedPlaceholder = NSAttributedString(string:" Number",
            attributes:[NSForegroundColorAttributeName: myWhite])
        cityTF.attributedPlaceholder = NSAttributedString(string:" City",
            attributes:[NSForegroundColorAttributeName: myWhite])
        stateTF.attributedPlaceholder = NSAttributedString(string:" State",
            attributes:[NSForegroundColorAttributeName: myWhite])
        zipTF.attributedPlaceholder = NSAttributedString(string:" Zip Code",
            attributes:[NSForegroundColorAttributeName: myWhite])
        phoneTF.attributedPlaceholder = NSAttributedString(string:" Phone number",
            attributes:[NSForegroundColorAttributeName: myWhite])
        bedsTF.attributedPlaceholder = NSAttributedString(string:" Number of Beds Available",
            attributes:[NSForegroundColorAttributeName: myWhite])
        
        //CODE HERE
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}