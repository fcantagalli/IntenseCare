//
//  ProfileViewController.swift
//  IntenseCare
//
//  Created by Felipe on 5/21/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController:UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var oldBack: CustomTextBackground!
    @IBOutlet weak var newBack: CustomTextBackground!
    @IBOutlet weak var oldPassTF: UITextField!
    @IBOutlet weak var newPassTF: UITextField!
    
    @IBOutlet weak var ResetPassword: UIButton!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var specialty: UITextField!

    var resetPassStatus:Bool = false
    var editStatus:Bool = false
    
    @IBAction func editProfile(sender: AnyObject) {
        
        if editStatus == false {
            editStatus = true
            
            nameTF.layer.cornerRadius = 7
            nameTF.layer.masksToBounds = true
            nameTF.layer.borderColor = UIColorFromHex("#007AFF", 0.8).CGColor
            nameTF.layer.borderWidth = 1
            nameTF.enabled = true
            
            emailTF.layer.cornerRadius = 7
            emailTF.layer.masksToBounds = true
            emailTF.layer.borderColor = UIColorFromHex("#007AFF", 0.8).CGColor
            emailTF.layer.borderWidth = 1
            emailTF.enabled = true
            
            phoneTF.layer.cornerRadius = 7
            phoneTF.layer.masksToBounds = true
            phoneTF.layer.borderColor = UIColorFromHex("#007AFF", 0.8).CGColor
            phoneTF.layer.borderWidth = 1
            // phoneTF.ma
            phoneTF.enabled = true

            specialty.layer.cornerRadius = 7
            specialty.layer.masksToBounds = true
            specialty.layer.borderColor = UIColorFromHex("#007AFF", 0.8).CGColor
            specialty.layer.borderWidth = 1
            specialty.enabled = true
            
        }
        else {
            editStatus = false
            nameTF.layer.borderWidth = 0
            nameTF.enabled = false
            
            emailTF.layer.borderWidth = 0
            emailTF.enabled = false
            
            phoneTF.layer.borderWidth = 0
            phoneTF.enabled = false
            
            specialty.layer.borderWidth = 0
            specialty.enabled = false
            
            saveChanges()
        }
        
    }
    
    @IBAction func resetPass(sender: AnyObject) {
        println("entro aqui")
        if resetPassStatus == false {
            ResetPassword.setTitle("    Save \nPassword", forState: UIControlState.Normal)
            resetPassStatus = true
            label.hidden = false
            oldBack.hidden = false
            newBack.hidden = false

        }
        else {
            ResetPassword.setTitle("    Reset \nPassword", forState: UIControlState.Normal)
            resetPassStatus = false
            label.hidden = true
            oldBack.hidden = true
            newBack.hidden = true
            
            resetPassword()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResetPassword.layer.cornerRadius = 7
        
        getUserInfo()
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
    
    func saveChanges() {
        var userId = NSUserDefaults.standardUserDefaults().objectForKey("userId") as! Int
        var postParam = "user_id=\(userId)"
        var values = [String:String]()
        if self.nameTF.text != "" {
            values["name"] = self.nameTF.text
        }
        if self.emailTF.text != "" {
            values["email"] = self.emailTF.text
        }
        if self.phoneTF.text != "" {
            values["phone"] = self.phoneTF.text
        }
        if self.specialty.text != "" {
            values["specialty"] = self.specialty.text
        }
        
        // verify how many itens we have
        if values.count > 0 {
            // something exist to be saved
            var keys = values.keys.array
            
            for var i = 0; i < count(keys) ; i++ {
                
                postParam += "&"+keys[i]+"="+values[keys[i]]!
                
            }
        }
        else {
            return;
        }
        
        println(postParam)
        
        var webService = WebServiceResource.webService
        webService.getWebContent(webService.UPDATE_USER, postVariables: postParam)
        dispatch_group_notify(webService.serviceGroup, dispatch_get_main_queue()) { () -> Void in
            var result = webService.result!
            var message = ""
            if result["user"].stringValue == "success" || result["physician"].stringValue == "success"{
                let alert = UIAlertController(title: "Informations successfully updated", message: nil , preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func resetPassword() {
        
        var shaPin = sha256(oldPassTF.text.dataUsingEncoding(NSUTF8StringEncoding)!)
        
        var passwordStored = NSUserDefaults.standardUserDefaults().objectForKey("password1") as! NSString
        
        if shaPin == passwordStored {
            var webService = WebServiceResource.webService
            var newShaPin = sha256(newPassTF.text.dataUsingEncoding(NSUTF8StringEncoding)!)
            var userId = NSUserDefaults.standardUserDefaults().objectForKey("userId") as! Int
            var postParam = "password=\(newShaPin)&user_id=\(userId)"
            println(postParam)
            webService.getWebContent(webService.ALTER_PASSWORD, postVariables: postParam)
            dispatch_group_notify(webService.serviceGroup, dispatch_get_main_queue(), { () -> Void in
                
                let result = webService.result!
                if result["success"] != nil {
                    var shaNewPass = sha256(self.newPassTF.text.dataUsingEncoding(NSUTF8StringEncoding)!)
                    
                    NSUserDefaults.standardUserDefaults().setObject(shaNewPass, forKey: "password1")
                    let alert = UIAlertController(title: "Password Updated", message: nil , preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else {
                    let alert = UIAlertController(title: "Unable to updated password", message: nil , preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
            
        }
        else {
            let alert = UIAlertController(title: "Wrong Password", message: nil , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func getUserInfo() {
        var userId = NSUserDefaults.standardUserDefaults().objectForKey("userId") as! Int
        var webService = WebServiceResource.webService
        var postParam = "user_id=\(userId)"
        webService.getWebContent(webService.GET_USER_INFO, postVariables: postParam)
        dispatch_group_notify(webService.serviceGroup, dispatch_get_main_queue()) { () -> Void in
            // load info about user
            var result = webService.result!
            
            if result["error"] == nil { // no error
                result = result[0] // just get the first one
                
                self.nameTF.text = result["name"].stringValue
                self.emailTF.text = result["email"].stringValue
                self.specialty.text = result["specialty"].stringValue
                self.phoneTF.text = result["phone"].stringValue
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {// return NO to not change text
        var fieldSize = count(textField.text)
        if range.length + range.location > fieldSize
        {
            return false;
        }
        
        var newLength = fieldSize + count(string) - range.length;
        return (newLength > 4) ? false : true;
        
    }
    
}