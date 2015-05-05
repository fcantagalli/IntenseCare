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
        var postParam:String!
        
        if nameTF.text == "" {
            println("name can´t be empty")
            nameTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert Hospital name",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        if address1TF.text == "" {
            println("address1 can´t be empty")
            address1TF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert Hospital address1",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        if address2TF.text == "" {
            println("address2 can´t be empty")
            address2TF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert Hospital address2",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        if numberTF.text == ""{
            println("number can´t be empty")
            numberTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert Hospital number",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        if cityTF.text == "" {
            println("city can´t be empty")
            cityTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert the City where it is located",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        if stateTF.text == "" {
            println("state can´t be empty")
            stateTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert the State where it is located",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        
        if zipTF.text == "" {
            println("zip can´t be empty")
            zipTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert Hospital zip code",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        if phoneTF.text == "" {
            println("phone can´t be empty")
            phoneTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert Hospital phone number",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        
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
    
    // two methods to dismiss keyboard after editing
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}