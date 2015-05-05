//
//  ViewController.swift
//  IntenseCare
//
//  Created by Felipe on 3/14/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPassword2: UITextField!
    
    // HERE INSIDE GOES THE CODE TO DO SOMETHING WITH THE BUTTON
    @IBAction func buttonSave(sender: UIButton) {
        // revify password
        if count(tfPassword.text) < 4 {
            let alert = UIAlertController(title: "Password too short", message: "Enter a 4 PIN password on the first password field" , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return;
        }
        if count(tfPassword2.text) < 4 {
            let alert = UIAlertController(title: "Password too short", message: "Enter a 4 PIN password on the second password field" , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return;
        }
        
        /*if tfPassword.text == tfPassword2.text {
            let alert = UIAlertController(title: "Same Passwords", message: "Both passwords cannot be the same for security reasons." , preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return;
        }*/
        
        //get hash of both passwords
        let pass1Data = (tfPassword.text as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        println(pass1Data)
        let pass1sha = sha256(pass1Data!)
        println(pass1sha)
        let pass2Data = (tfPassword2.text as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        let pass2sha = sha256(pass2Data!)
        println(pass2sha)
        
        NSUserDefaults.standardUserDefaults().setObject(pass1sha, forKey: "password1")
        NSUserDefaults.standardUserDefaults().setObject(pass2sha, forKey: "password2")
        //NSUserDefaults.standardUserDefaults().setObject(tfName.text, forKey: "name")
       // NSUserDefaults.standardUserDefaults().setObject(tfemail, forKey: "email")
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myWhite = UIColor(white: 1, alpha: 0.2)
        // set Placeholder text and color for name text field
        tfName.attributedPlaceholder = NSAttributedString(string:" Name",
            attributes:[NSForegroundColorAttributeName: myWhite])
        // set Placeholder text and color for email text filed
        tfemail.attributedPlaceholder = NSAttributedString(string:" E-Mail", attributes: [NSForegroundColorAttributeName: myWhite])
        // set Placeholder text and color for password 1 text field
        tfPassword.attributedPlaceholder = NSAttributedString(string:" 4 Numbers PIN Password Access", attributes: [NSForegroundColorAttributeName: myWhite])
        // set Placeholder text and color for password 2 text field
        tfPassword2.attributedPlaceholder = NSAttributedString(string:" 4 Numbers PIN Security Password Access", attributes: [NSForegroundColorAttributeName: myWhite])
        
        tfPassword.delegate = self
        tfPassword2.delegate = self
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
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
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

