//
//  LoginViewController.swift
//  IntenseCare
//
//  Created by Felipe on 3/19/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //Outlets to the elements
    @IBOutlet weak var pinCircleView: UIView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    //Constants
    let kVTPinPadViewControllerCircleRadius:CGFloat = 6.0
    
    enum settingNewPinState: Int {
        case settingNewPinStateConfirm = 1
        case settingNewPinStateFirst = 0
    }
    
    //Variables
    var inputPin:NSMutableString = ""
    var circleViewList:NSMutableArray = []
    var newPinState:settingNewPinState = settingNewPinState.settingNewPinStateFirst
    var firstPassCode = ""
    var laInstructionsLabel:UILabel
    var shake = 0
    var direction = 1
    var isSettingPinCode:Bool
    
    // IBActions of all elements
    @IBAction func resetPin(sender: AnyObject) {
        addCircle()
        self.newPinState = .settingNewPinStateFirst
        self.laInstructionsLabel.text = "Enter PassCode"
        inputPin = NSMutableString()
    }
    
    @IBAction func numberButtonClick(sender:AnyObject) {
        
        if inputPin == "" {
            inputPin = NSMutableString()
        }
        if errorView.hidden == false {
            changeStatusBarHidden(true)
        }
        inputPin.appendString(sender.titleForState(UIControlState.Normal)!)
        self.fillingCircle(inputPin.length - 1)
        
        if self.isSettingPinCode {
            if self.pinLength() == inputPin.length {
                if self.newPinState == settingNewPinState.settingNewPinStateFirst {
                    self.firstPassCode = inputPin
                    //reset and prepare for confirmation stage
                    resetPin(sender)
                    self.newPinState = settingNewPinState.settingNewPinStateConfirm
                    //update instruction label
                    self.laInstructionsLabel.text = "Confirm PassCode"
                }
                else {
                    // we are at confirmation stage check this pin with original one
                    if self.firstPassCode == inputPin {
                        //every thing is ok
                        dismissPinPad()
                    }
                    else{
                        //reset to first stage
                        self.laInstructionsLabel.text = "Enter PassCode"
                        direction = 1
                        shake = 0
                        shakeCircle(pinCircleView)
                        changeStatusBarHidden(false)
                        resetPin(sender)
                        
                    }
                }
            }
        }
        else {
            if pinLength() == inputPin.length && checkPin(inputPin) == true {
                var delayInSeconds:Double = 0.3
                var nsec = Double(NSEC_PER_SEC) * delayInSeconds
                var popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(nsec))
                
                dispatch_after(popTime, dispatch_get_main_queue(), { () -> Void in
                    println("Correct Pin")
                    self.resetPin(sender)
                    if self.respondsToSelector(Selector("pinPadSuccessPin")) {
                        self.pinPadSuccessPin()
                    }
                    self.dismissPinPad()
                })
            }
            else if pinLength() == inputPin.length {
                self.errorView.hidden = false
                direction = 1
                shake = 0
                shakeCircle(pinCircleView)
                changeStatusBarHidden(false)
                println("Not correct pin")
            }
        }
    }
    
    // initializer
    required init(coder aDecoder: NSCoder) {
        newPinState = settingNewPinState.settingNewPinStateFirst
        laInstructionsLabel = UILabel()
        isSettingPinCode = false
        super.init(coder: aDecoder)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCircle() // add circles that will fill according the user types
        
        // add code here
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    func dismissPinPad() {
        if self.respondsToSelector(Selector("pinPadWillHide")) {
            pinPadWillHide()
        }
        if self.respondsToSelector(Selector("pinPadDidHide")) {
            pinPadDidHide()
        }
    }
    
    func changeStatusBarHidden(hidden:Bool) {
        errorView.hidden = hidden
        
        if UIDevice.currentDevice().systemVersion > "6.9" {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    /*
    override func prefersStatusBarHidden() -> Bool {
        return errorView.hidden
    }*/
    /*
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }*/
    
    // functions of fields
    func checkPin(pin:String) -> Bool {
        var shaPin = sha256(pin.dataUsingEncoding(NSUTF8StringEncoding)!)
        
        var passwordStored = NSUserDefaults.standardUserDefaults().objectForKey("password1") as NSString
        
        if shaPin == passwordStored {
            return true
        }
        else {
            return false
        }
    }
    
    func pinLength() -> Int {
        return 4
    }
    
    func pinPadSuccessPin() {
        
    }
    func pinPadWillHide() {
        
    }
    func pinPadDidHide() {
        
    }
    
    
    // DEAL WITH THE CIRCLES section
    
    // fill the circles when typing the pin
    func fillingCircle(symbolIndex:NSInteger) {
        if symbolIndex >= circleViewList.count {
            return
        }
        var circleView:PPPinCircleView = circleViewList.objectAtIndex(symbolIndex) as PPPinCircleView
        circleView.backgroundColor = UIColor.whiteColor()
    }
    // shake the circles
    func shakeCircle(theOneYouWannaShake:UIView) {
        
        UIView.animateWithDuration(0.03, animations:{
            theOneYouWannaShake.transform = CGAffineTransformMakeTranslation(5*CGFloat(self.direction), 0)
            } , completion: { (value:Bool) in
                if self.shake >= 15 {
                    theOneYouWannaShake.transform = CGAffineTransformIdentity
                    self.resetPin(theOneYouWannaShake) // the objecto will not be used
                    return
                }
                self.shake++
                self.direction = self.direction * -1
                self.shakeCircle(theOneYouWannaShake)
        })
        
    }
    
    // add circles to the screen
    func addCircle(){
        
        if self.isViewLoaded() {
            for subview in pinCircleView.subviews {
                subview.removeFromSuperview()
            }
            circleViewList.removeAllObjects()
            circleViewList = NSMutableArray()
            
            var neededWidth:CGFloat = ( CGFloat(self.pinLength())*self.kVTPinPadViewControllerCircleRadius)
            var shiftBetweenCircle:CGFloat = (pinCircleView.frame.size.width - neededWidth)/CGFloat((self.pinLength()+2))
            var indent = shiftBetweenCircle*1.5
            
            if shiftBetweenCircle > self.kVTPinPadViewControllerCircleRadius*5.0 {
                shiftBetweenCircle = kVTPinPadViewControllerCircleRadius*5.0
                var aux = (self.pinLength() > 1 ? (self.pinLength()-1) : 0)
                indent = (CGFloat(pinCircleView.frame.size.width)-neededWidth-shiftBetweenCircle*CGFloat(aux))/CGFloat(2)

            }
            
            for var i = 0 ;i < self.pinLength();i++ {
                var circleView = PPPinCircleView(radius: self.kVTPinPadViewControllerCircleRadius)
                var circleFrame = circleView.frame
                var iFloat = CGFloat(i)
                circleFrame.origin.x = indent+iFloat*self.kVTPinPadViewControllerCircleRadius+iFloat*shiftBetweenCircle
                circleFrame.origin.y = (CGRectGetHeight(pinCircleView.frame) - self.kVTPinPadViewControllerCircleRadius)/2.0
                circleView.frame = circleFrame
                pinCircleView.addSubview(circleView)
                circleViewList.addObject(circleView)
            }
            
        }
    
    }
}

// auxiliary classes
class PPCircleButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Initialization code
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.cornerRadius = CGRectGetHeight(rect)/2.0
        var color = UIColor(white: 1,alpha:0.75)
        self.layer.borderColor = color.CGColor
        self.layer.borderWidth = 0.2
    }
}

class PPPinCircleView:UIImageView{
    
    init(radius:CGFloat){
        super.init(frame: CGRectMake(0.0, 0.0, radius*2.0, radius*2.0))
        self.layer.cornerRadius = radius
        var color = UIColor(white: 1.0, alpha: 0.5)
        self.layer.borderColor = color.CGColor
        self.layer.borderWidth = 2.0
        
        //initialization Code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
