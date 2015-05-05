//
//  InsertPatientCV.swift
//  IntenseCare
//
//  Created by Felipe on 4/26/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class InsertPatientCV:UIViewController,UITextFieldDelegate {
    
    // Outlets for the collected data
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var StatusTF: UITextField!
    @IBOutlet weak var bedTF: UITextField!
    @IBOutlet weak var birthTF: UITextField!
    @IBOutlet weak var arrivalDateTF: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBAction func birthTFEdition(sender: AnyObject) {
        var datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        birthTF.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("birthTFValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "MM-dd-yyyy"
        birthTF.text = timeFormatter.stringFromDate(datePickerView.date)
    }
    func birthTFValueChanged(sender: UIDatePicker) {
        println(sender.date)
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "MM-dd-yyyy"
        birthTF.text = timeFormatter.stringFromDate(sender.date)
    }
    
    @IBAction func arrivalTFEdition(sender: AnyObject) {
        var datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        arrivalDateTF.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("arrivalTFValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "MM-dd-yyyy"
        arrivalDateTF.text = timeFormatter.stringFromDate(datePickerView.date)
    }
    
    func arrivalTFValueChanged(sender: UIDatePicker) {
        println(sender.date)
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "MM-dd-yyyy"
        arrivalDateTF.text = timeFormatter.stringFromDate(sender.date)
    }
    
    // save button
    @IBAction func saveButton(sender: AnyObject) {
        var hospital_id = 1
        var postParam:String = "hospital_id="+String(hospital_id)
        //bed check
        if bedTF.text == "" {
            println("bed can´t be empty")
            bedTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert bed number",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        else{
            postParam = postParam + "&bed="+bedTF.text
        }
        
        // status check
        if StatusTF.text == "" {
            println("bed can´t be empty")
            StatusTF.attributedPlaceholder = NSAttributedString(string: " Can't be empty. Insert the Patient Status",attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            return
        }
        else{
            postParam = postParam + "&status="+StatusTF.text
        }
        
        //arrival date
        if arrivalDateTF.text == "" {
            println("bed can´t be empty")
            bedTF.placeholder = "Can't be empty. Insert the arrival date"
            return
        }
        else{
            postParam = postParam + "&arrival_date="+arrivalDateTF.text
        }
        
        //name
        if nameTF.text != "" {
            postParam = postParam + "&name="+nameTF.text
        }
        
        //birth
        if birthTF.text != "" {
            postParam = postParam + "&birth="+birthTF.text
        }
        println(postParam)
        
        var result = WebServiceResource.getWebContent(WebServiceResource.INSERT_PATIENT, postVariables: postParam)
        println(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myWhite = UIColor(white: 1, alpha: 0.2)
        
        // set Placeholder text and color for name text field
        nameTF.attributedPlaceholder = NSAttributedString(string:" Name",
            attributes:[NSForegroundColorAttributeName: myWhite])
        StatusTF.attributedPlaceholder = NSAttributedString(string:" Status",
            attributes:[NSForegroundColorAttributeName: myWhite])
        bedTF.attributedPlaceholder = NSAttributedString(string:" Bed",
            attributes:[NSForegroundColorAttributeName: myWhite])
        birthTF.attributedPlaceholder = NSAttributedString(string:" ex: MM/DD/YYYY",
            attributes:[NSForegroundColorAttributeName: myWhite])
        arrivalDateTF.attributedPlaceholder = NSAttributedString(string:" ex: MM/DD/YYYY",
            attributes:[NSForegroundColorAttributeName: myWhite])
        
        var touch = UITapGestureRecognizer(target:self, action:Selector("handlePan"))
        touch.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(touch)

        // CODE HERE
    }
    
    func handlePan() {
        println("toque")
        scrollView.endEditing(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}