//
//  ViewController.swift
//  IntenseCare
//
//  Created by Felipe on 3/14/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPassword2: UITextField!
    
    // HERE INSIDE GOES THE CODE TO DO SOMETHING WITH THE BUTTON
    @IBAction func buttonSave(sender: UIButton) {
        // CODE HERE
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
        tfPassword.attributedPlaceholder = NSAttributedString(string:" Access Password", attributes: [NSForegroundColorAttributeName: myWhite])
        // set Placeholder text and color for password 2 text field
        tfPassword2.attributedPlaceholder = NSAttributedString(string:" Security Password", attributes: [NSForegroundColorAttributeName: myWhite])
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }

}

