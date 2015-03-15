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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myWhite = UIColor(white: 1, alpha: 0.2)
        
        tfName.attributedPlaceholder = NSAttributedString(string:"    Name",
            attributes:[NSForegroundColorAttributeName: myWhite])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

