//
//  Login&ForgotView.swift
//  Success! App
//
//  Created by mac on 18/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class LoginForgotView: UIViewController {

    @IBOutlet var email_addrs: UITextField!
    
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func loginLetGo_Btn(_ sender: Any) {
   
        
//     http://mobileappdevelop.co/SUCCESS/webservice/login?email=test@gmail.com&password=12345        
        
        
        WebHelper.requestPostUrl("http://mobileappdevelop.co/SUCCESS/webservice/login?email=test@gmail.com&password=12345", controllerView: self, success: {(_ respon: [AnyHashable: Any]) -> Void in
            //Success
            
            
            let responceDict = respon as NSDictionary
            print("respon: \(responceDict)")
            
            
            if responceDict.count == 0 {
            
                DispatchQueue.main.async {
                    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "server Fail 1", on: self)
                }
         
            }
            else{
            
                let status : String = responceDict["message"] as! String
                    if status == "successfull" {
                        
                          // Bounce back to the main thread to update the UI******
                        DispatchQueue.main.async {
                            

                            let userDict = responceDict.value(forKey: "result") as! NSDictionary
                        
                            UserDefaults.standard.set(userDict.value(forKey: "id"), forKey: "userID")
                        
                        }
                
                }
                else {
            
                DispatchQueue.main.async {
                    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "No Data Found 2", on: self)
                }
            
            }
            }
            
        }, failure: {(_ error: Error?) -> Void in
        
            //error
        
        
        
        })
     
    }
    
    
    
    func gotoHome() {
    
        let nx : DashBoardView = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardView") as! DashBoardView
        self.navigationController?.pushViewController(nx, animated: true)
        
    
    }
    
    
    @IBAction func forgot_Password(_ sender: Any) {
        
        
        
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "Reset your password", preferredStyle: .alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Do some stuff
            
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        
        
        let nextAction: UIAlertAction = UIAlertAction(title: "Send", style: .default) { action -> Void in
            //Do some other stuff
            let fields = actionSheetController.textFields!;
            print("Your email address is: "+fields[0].text!);
            

        
        

//       http://mobileappdevelop.co/SUCCESS/webservice/forgot_password?email=abcxyz@gmail.com
        
        WebHelper.requestPostUrl("http://mobileappdevelop.co/SUCCESS/webservice/forgot_password?email=\(fields[0].text!)", controllerView: self, success: {(_ respon: [AnyHashable: Any]) -> Void in
        
           
//            success
            
            
            let responseDict = respon as NSDictionary
            print("respon\(responseDict)")
            
            
            if responseDict.count == 0 {
            
            
            
                DispatchQueue.main.async {
                    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server Not Found Please Check your Internet Connection! 1", on: self)
                }
            }
                else {

                let status : String = responseDict["message"] as! String
                if status == "successfull" {
                
                    // Bounce back to the main thread to update the UI
                    let alert = UIAlertController(title: "Email sent Successfully", message: "Please Check Your Email", preferredStyle: .alert)
                    
                    let btn_action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alert.addAction(btn_action)
                    self.dismiss(animated: true, completion: nil)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }
                
                else {
                
                    DispatchQueue.main.async {
                        GlobalConstant.showAlertMessage(withOkButtonAndTitle: "Sorry", andMessage: "No Data Found!", on: self)
                    }
                
                }

                }
       
            
         },failure: {(_ error: Error?) -> Void in
        
            // erroe hua to ..-->
            
            DispatchQueue.main.async {
                GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "", on: self)
            }


        })
}


                        actionSheetController.addAction(nextAction)
                        //Add a text field
                        actionSheetController.addTextField { textField -> Void in
                            //TextField configuration
                            textField.textColor = UIColor.black
                            textField.placeholder = "Please Enter Your email"
                            //            textField.textColor = UIColor.blue
                            textField.font = UIFont(name: "AmericanTypewriter", size: 14)
        
                        }
        
                        //Present the AlertController
                        self.present(actionSheetController, animated: true, completion: nil)
                        
                    }
    
    
    
    
    @IBAction func goBack(_ sender: Any) {

    print("Back pressed")
    self.navigationController?.popViewController(animated: true)
 
    }
    
    
                }







