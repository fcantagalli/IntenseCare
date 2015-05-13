	//
//  Resource.swift
//  IntenseCare
//
//  Created by Felipe on 4/3/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation
import UIKit
    
    struct AppColors {
        static var barColor = UIColorFromHex("3DC8AB", 1.0)
    }
    
        struct WebServiceResource {
            static let GET_PATIENT_BY_HOSPITAL_ID = "http://bianca.letti.com.br/IntenseCare/patient.php?method=getPatientByHospitalId"
            static let INSERT_PATIENT = "http://bianca.letti.com.br/IntenseCare/patient.php?method=insertPatient"
            static let GET_HOSPITALS = "http://bianca.letti.com.br/IntenseCare/hospital.php?method=getHospitalList"
            static let INSERT_HOSPITAL = "http://bianca.letti.com.br/IntenseCare/hospital.php?method=insertHospital"
            static let UPDATE_PATIENT_STATUS = "http://bianca.letti.com.br/IntenseCare/patient.php?method=updateStatus"
            static let UPDATE_PATIENT_BED = "http://bianca.letti.com.br/IntenseCare/patient.php?method=updateBed"
            
            static func getWebContent(method:String, postVariables:String?) -> JSON {
                
                //URL request
                var url = NSURL(string:method)
                println("passou 1")
                //creating post request
                
                var request = NSMutableURLRequest(URL: url!)
                request.HTTPMethod = "POST"
                println("passou 2")
                // setting POST parameters
                if postVariables != nil{
                    var dataString = postVariables!
                    let requestBodyData = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
                    request.HTTPBody = requestBodyData
                }
                println("passou 3")
                
                var json:JSON?
                let group = dispatch_group_create()
                let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                    (data,response,error) in
                    println("passou 4")
                    if error == nil { // it worked
                        //println(NSString(data: data, encoding: NSUTF8StringEncoding))
                        //println("passou 6")
                        var jsonaux:JSON = JSON(data: data)
                        println(jsonaux)
                        
                        json =  jsonaux;
                    }
                    else{
                        println("passou 5")
                        println(error)
                    }
                    dispatch_group_leave(group)
                    
                }
                
                dispatch_group_enter(group)
                task.resume()
                dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
                
                return json!;
            }
    }
    
// computes the hash value for the password
func sha256(data : NSData) -> NSString {
    var hash = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
    CC_MD5(data.bytes, CC_LONG(data.length), &hash)
    let res = NSData(bytes: hash, length: Int(CC_MD5_DIGEST_LENGTH))
    return res.hexString()
}
    
func UIColorFromHex (hex:String, alpha:CGFloat) -> UIColor {
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
    
    if (cString.hasPrefix("#")) {
        cString = cString.substringFromIndex(advance(cString.startIndex, 1))
    }
    
    if (count(cString) != 6) {
        return UIColor.grayColor()
    }
    
    var rgbValue:UInt32 = 0
    NSScanner(string: cString).scanHexInt(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: alpha
    )
}

extension NSData {
    
    func hexString() -> NSString {
        var str = NSMutableString()
        let bytes = UnsafeBufferPointer<UInt8>(start: UnsafePointer(self.bytes), count:self.length)
        for byte in bytes {
            str.appendFormat("%02hhx", byte)
        }
        return str
    }
}