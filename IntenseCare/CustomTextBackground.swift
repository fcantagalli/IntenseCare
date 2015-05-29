//
//  CustomTextBackground.swift
//  IntenseCare
//
//  Created by Felipe on 5/5/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import UIKit

@IBDesignable class CustomTextBackground: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSizeMake(7, 7) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.shadowColor = shadowColor.CGColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 7 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    override init(frame: CGRect) {
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 1. setup any properties here
        var shadowFrame = frame
        var shadowPath = UIBezierPath(rect: shadowFrame)
        layer.shadowPath = shadowPath.CGPath;
    }
    
    required init(coder aDecoder: NSCoder) {
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 1. setup any properties here
        var shadowFrame = layer.bounds
        var shadowPath = UIBezierPath(rect: shadowFrame)
        layer.shadowPath = shadowPath.CGPath;
    }

}

@IBDesignable class CustomButton:UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSizeMake(7, 7) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.shadowColor = shadowColor.CGColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 7 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    override init(frame: CGRect) {
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 1. setup any properties here
        var shadowFrame = frame
        var shadowPath = UIBezierPath(rect: shadowFrame)
        layer.shadowPath = shadowPath.CGPath;
    }
    
    required init(coder aDecoder: NSCoder) {
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 1. setup any properties here
        var shadowFrame = layer.bounds
        var shadowPath = UIBezierPath(rect: shadowFrame)
        layer.shadowPath = shadowPath.CGPath;
    }
    
    
    
}
