//
//  ConsultatonTabsController.swift
//  IntenseCare
//
//  Created by Felipe on 5/11/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class ConsultationTabsController:UITabBarController {
    
    var patientName:String = ""
    var barColor:UIColor!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}