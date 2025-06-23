//
//  GlobalConstant.swift
//  Success! App
//
//  Created by mac on 28/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit
import ReachabilitySwift
class GlobalConstant: NSObject {
    
    let strMainUrl : NSString = "http://resultmakershosting.nl/SINT/webservice.php?"
    
    class func showAlertMessage(withOkButtonAndTitle strTitle: String, andMessage strMessage: String, on controller: UIViewController) {
        
        let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        controller.present(alertController, animated: true, completion: { _ in })
        
    }
    class func isReachable() -> Bool {
        let reach = Reachability(hostname: "www.google.com")
        return reach!.isReachable
    }
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
