
//
//  SignUP View.swift
//  Success! App
//
//  Created by mac on 18/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class SignUpView: UIViewController {

    
    @IBOutlet var first_Name: UITextField!

  
    @IBOutlet var Last_Name: UITextField!

    @IBOutlet var email: UITextField!
    
    
    @IBOutlet var passWord: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    

//    
//    func textFieldValidation() -> Bool{
//    
//        if first_Name.text == "" {
//            
//            GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Please Enter Fiest Name", on: self)
//        return true
//        }
//    
//        if Last_Name.text == "" {
//        
//        GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Please Enter Last Name", on: self)
//        
//            return true
//        }
//        
//        
//        if email.text == "" {
//        GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Please Enter Email Address", on: self)
//            
//        return true
//        }
//
//        
//    return true
//    }
//
//    func isValidEmail(textStr:String) -> Bool {
//    
//    
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: textStr)
//
//    }
//   
    

    @IBAction func lets_Go_BTN(_ sender: Any) {
        
  
        
        
        
        
 //      http://mobileappdevelop.co/SUCCESS/webservice/signup?first_name=abc&last_name=xyz&email=abcxyz@gmail.com&password=12345
        
           
        
        WebHelper.requestPostUrl("http://mobileappdevelop.co/SUCCESS/webservice/signup?first_name=\(first_Name.text!)&last_name=\(Last_Name.text!)&email=\(email.text!)&password=\(String(describing: passWord.text))", controllerView: self, success: {(_ respon: [AnyHashable: Any]) -> Void in
            
            //success
        
       let responseDict = respon as NSDictionary
        print("respon:\(responseDict)")
        
            
            
            if responseDict.count == 0
            {
            
                DispatchQueue.main.async {
                    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server not Found 1", on: self)
                }
            
            }else {
                let status : String = responseDict["message"] as! String
                if status == "successfull" {
                    // Bounce back to the main thread to update the UI
                    DispatchQueue.main.async {
                        
                        
                        let userDict = responseDict.value(forKey: "result") as! NSDictionary
                        UserDefaults.standard.set(userDict.value(forKey: "id"), forKey: "userID")
                        
                        
                        
                        self.goToNext()
                        
                    }
                }
                else{
                    DispatchQueue.main.async {
                        GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "No Data Found! 2", on: self)
                    }
                }
            }
            
     
      
            
}, failure: {(_error: Error?) -> Void in
            //error
    
    DispatchQueue.main.async {
        GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server Not Found 3", on: self)
    }
            
            
        })
  
        
        
        
        
        
        
        
    }



    func goToNext() {
    
        let go : DashBoardView = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardView") as! DashBoardView
        
        self.navigationController?.pushViewController(go, animated: true)
        
    }

    
    @IBAction func go_Back(_ sender: Any) {
        
        
        print("Back pressed")
        self.navigationController?.popViewController(animated: true)

    }
    
}


