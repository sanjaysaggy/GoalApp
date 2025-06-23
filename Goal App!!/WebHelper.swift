 //
//  RequestMethods.swift
//  Success! App
//
//  Created by mac on 28/08/17.
//  Copyright © 2017 ios. All rights reserved.
//
import UIKit
class WebHelper: NSObject {
    
    
    class func requestPostUrl(_ strURL: String, controllerView viewController: UIViewController, success: @escaping (_ response: [AnyHashable: Any]) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        
        MBProgressHUD.hide(for: viewController.view, animated: true)
        let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
        hud.label.text = "Loading..."
        if GlobalConstant.isReachable() {
            
            
            let session = URLSession.shared
            
            let urlwithPercentEscapes = strURL.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
            print(strURL);
            let urlPath = NSURL(string: urlwithPercentEscapes!)
            
            let request = NSMutableURLRequest(url: urlPath! as URL)
            request.timeoutInterval = 60
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    // Bounce back to the main thread to update the UI
                    DispatchQueue.main.async {
                        MBProgressHUD.hide(for: viewController.view, animated: true)
                    }
                }
                
                if((error) != nil) {
                    print(error!.localizedDescription)
                    failure(error)
                }else {
                    _ = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
                    let _: NSError?
                    let jsonResult: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options:    JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    success(jsonResult as! [AnyHashable : Any])
                }
                
            })
            
            task.resume()
        }
        else {
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: viewController.view, animated: true)
                GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Verbinding maken met internet", on: viewController)
            }
            
        }
    }
    
    class func requestPostUrlWithImage(_ strURL: String,image_data:NSData, controllerView viewController: UIViewController, success: @escaping (_ response: [AnyHashable: Any]) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        
        MBProgressHUD.hide(for: viewController.view, animated: true)
        let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
        hud.label.text = "Loading..."
        if GlobalConstant.isReachable() {
            let urlStr : NSString = strURL.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString
            let url = URL(string: urlStr as String)
            
            let request = NSMutableURLRequest(url: url!)
            request.httpMethod = "POST"
            
            let boundary = "Boundary-\(UUID().uuidString)"
            
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            let body = NSMutableData()
            
            let fname = "test.png"
            let mimetype = "image/png"
            
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition:form-data; name=\"image\"\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append("hi\r\n".data(using: String.Encoding.utf8)!)
            
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition:form-data; name=\"user_image\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(image_data as Data)
            body.append("\r\n".data(using: String.Encoding.utf8)!)
            
            body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
            
            request.httpBody = body as Data
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    // Bounce back to the main thread to update the UI
                    DispatchQueue.main.async {
                        MBProgressHUD.hide(for: viewController.view, animated: true)
                    }
                }
                
                if((error) != nil) {
                    print(error!.localizedDescription)
                    failure(error)
                }else {
                    _ = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
                    let _: NSError?
                    let jsonResult: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options:    JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    success(jsonResult as! [AnyHashable : Any])
                }
                
            })
            task.resume()
        }
        else {
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: viewController.view, animated: true)
                GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Internet not connected", on: viewController)
            }
            
        }
    }
    func generateBoundaryString() -> String
    {
        return "Boundary-\(UUID().uuidString)"
    }
}

