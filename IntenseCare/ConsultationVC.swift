//
//  ConsultationVC.swift
//  IntenseCare
//
//  Created by Felipe on 5/6/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class ConsultationViewController: UIViewController, UITextFieldDelegate {
    
    //OUTLETS AND ACTIONS
    @IBOutlet weak var navItem: UINavigationItem!
    
        //Respiratory System
    @IBOutlet weak var FIO2TF: UITextField!
    @IBOutlet weak var pa02: UITextField!
    @IBOutlet weak var mechVentSwitch: UISwitch!
    
    @IBAction func RespiratorySaveButton(sender: AnyObject) {
        // save here
    }
    
        //Nervous System
    @IBOutlet weak var glasgowTF: UITextField!
    @IBAction func NervousSaveButton(sender: AnyObject) {
        // save here
        
    }
    
        //Liver
    @IBOutlet weak var bilirubinTF: UITextField!
    @IBAction func liverSaveButton(sender: AnyObject) {
        // save here
    }
    
        // cardio vascular system
    @IBOutlet weak var mapTF: UITextField!
    @IBOutlet weak var vasopressorsSwitch: UISwitch!
    @IBOutlet weak var dopTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var epiTF: UITextField!
    @IBOutlet weak var norTF: UITextField!
    
    @IBAction func CardioSaveButton(sender: AnyObject) {
        //save here
    }
    
        // Coagulation
    @IBOutlet weak var plateletsTF: UITextField!
    @IBAction func coagulationSaveButton(sender: AnyObject) {
        //save here
    }
    
        // Renal System
    @IBOutlet weak var creatinineTF: UITextField!
    @IBOutlet weak var urineTF: UITextField!
    @IBAction func renalSaveButton(sender: UIButton) {
        // save here
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabController = self.tabBarController as! ConsultationTabsController
        
        self.parentViewController?.navigationItem.title = tabController.patientName
        self.parentViewController?.navigationController?.navigationBar.barTintColor = tabController.barColor
        self.parentViewController?.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
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