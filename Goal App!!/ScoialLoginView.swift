//
//  ViewController.swift
//  Success! App
//
//  Created by mac on 17/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKLoginKit
import AlamofireImage

class ScoialLoginView: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    
    var dict : NSDictionary! = [:]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signOut()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
  

    @IBAction func google_Login(_ sender: Any) {
     
        GIDSignIn.sharedInstance().signIn()

        
        
        
        
        
    }
  
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error == nil) {

            // Perform any operations on signed in user here.
            
//            let userId = user.userID                  // For client-side use only!
            
            let idToken = user.authentication.idToken // Safe to send to the server
            
//            let fullName = user.profile.name
            
//            let givenName = user.profile.givenName
            
            let familyName = user.profile.familyName
            let email = user.profile.email
            
            // ...for Display...->
            let dimension = round(100 * UIScreen.main.scale)
            let pic  = user.profile.imageURL(withDimension: UInt(dimension))
            
            // ...
            
            
            
            Alamofire.request(pic!, method: .get).responseImage { response in
                guard let image = response.result.value else {
                    // Handle error
                    return
                }
                
                //  To Get DATA like and value IMAGE DATA..*.....-->>
                
                let imageData : Data = UIImageJPEGRepresentation(image, 0.5)!
                
                
                self.mySocialLoginSocailID(first_nam: familyName!, last_nam: familyName!, email: email!, image: imageData, socialid: idToken!)
            }
        }
         else {
            print("\(error.localizedDescription)")
        }
    }
   
    @IBAction func facebook_Login(_ sender: Any) {
    
    
    let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
    fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
        if (error == nil)
        {
    
            let fbloginresult : FBSDKLoginManagerLoginResult = result!
    if fbloginresult.grantedPermissions != nil
    {
    if(fbloginresult.grantedPermissions.contains("email"))
        
    {
    if((FBSDKAccessToken.current()) != nil){
    
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
        
    if (error == nil) {
        
    self.dict = result as! NSDictionary
    print(result!)
    print(self.dict)
        
        let userID = self.dict.value(forKey: "id") as! String
    let facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
    
        Alamofire.request(URL(string: facebookProfileUrl)!, method: .get).responseImage { response in
    guard let image = response.result.value else {
        
   
    return
    }
    
        //  To Get DATA like and value IMAGE DATA..*.....-->>
      
    let imageData : Data = UIImageJPEGRepresentation(image, 0.5)!
   self.mySocialLoginSocailID ( first_nam: self.dict.value(forKey: "first_name") as! String, last_nam: self.dict.value(forKey: "last_name") as! String, email: self.dict.value(forKey:"email") as! String, image: imageData, socialid: self.dict.value(forKey:"id") as! String)    }
    }
   
    })
   
        }
    }
  
        }
    }
   
        }
    }
    
    
    
//    @IBAction func facebook_Login(_ sender: Any) {
//    
//    
//        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
//        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
//            if (error == nil){
//                let fbloginresult : FBSDKLoginManagerLoginResult = result!
//                if fbloginresult.grantedPermissions != nil {
//                    if(fbloginresult.grantedPermissions.contains("email"))
//                    {
//                        self.getFBUserData()
//                        fbLoginManager.logOut()
//                    }
//                }
//            }
//        }
//        
//        
//        
//    }
//    
//    func getFBUserData(){
//        if((FBSDKAccessToken.current()) != nil){
//            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
//                if (error == nil){
//                    self.dict = result as! NSDictionary
//                    print(result!)
//                    print(self.dict)
//                    
//                       //  To Get DATA like and value IMAGE DATA..*.....
//                    
//                    let userID = self.dict.value(forKey: "id") as! String
//                    let facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
//                    Alamofire.request(URL(string: facebookProfileUrl)!, method: .get).responseImage { response in
//                        guard let myimage = response.result.value else {
//                    //  To Get * IMAGE DATA..*.....
//                    
//                    let imageData : Data = UIImageJPEGRepresentation(myimage, 0.5)
//                    
//                }
//            })
//            
//            
//            self.mySocialLoginSocailID ( first_nam: self.dict.value(forKey: "first_name") as! String, last_nam: self.dict.value(forKey: "last_name") as! String, email: self.dict.value(forKey:"email") as! String, userImage: imageData, socialid: self.dict.value(forKey:"id") as! String)
//
//            
//        }
//    }

    
   
    func mySocialLoginSocailID (first_nam :String, last_nam : String, email :String, image :Data, socialid : String) {

// http://mobileappdevelop.co/SUCCESS/webservice/social_login?social_id=123&first_name=qq&last_name=ww&email=qq@gmail.com&password=12345
    
        WebHelper.requestPostUrlWithImage("http://mobileappdevelop.co/SUCCESS/webservice/social_login?social_id=\(socialid)&first_name=\(first_nam)&last_name=\(last_nam)&email=\(email)", image_data: image as NSData, controllerView: self, success: { (_ responce: [AnyHashable : Any]) in
            //Success
            let responseDict = responce as NSDictionary
            print("responce:\(responseDict)")
            if  responseDict.count == 0
        {
        
            
        
        
            DispatchQueue.main.async {
                GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server Not Found Please Check your Internet Connection! 1", on: self)
            
            }
        }
            else {
            
                let status : String = responseDict["message"] as! String
                if  status == "successfull" {
                
                
                   _ = responseDict.value(forKey: "result") as! NSDictionary
                
                    
                    DispatchQueue.main.async {
                        self.gotoNextViewController()

                    }
                    
                }
                else{
                
                    DispatchQueue.main.async {
                        GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Data Not Found 2", on: self)
                    }
                
                }
        }
       
        
        
        
    
    
    
    }, failure: {(_ error: Error?) -> Void in
    
    
        //error
        
        DispatchQueue.main.async {
            GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server Not Found. Please check Your Internet! 3", on: self)
        }
    
    
    })
    
    
    
    

}






    
    // Navigate to Controller......

    func gotoNextViewController() {
    
    
    
        
        let po : DashBoardView = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardView") as! DashBoardView
        
        self.navigationController?.pushViewController(po, animated: true)
        

    
    }
    
}



















//        *********************************** CODE END  ***********************************












//
//        gradient = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.red.cgColor, UIColor.purple.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor]
//        gradient.locations = [0, 0.1, 0.9, 1]
//        view.layer.addSublayer(gradient)
//

//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
//        let gradient = CAGradientLayer()
//
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
//
//        view.layer.insertSublayer(gradient, at: 0)
//        view.addSubview(view)
//
//

//
//        // Initialize a gradient view
//        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
//
//        gradientView.frame = view.bounds
//        // Set the gradient colors
//       gradientView.colors = [UIColor.green.cgColor, UIColor.black.cgColor]
//        // Optionally set some locations
//        gradientView.locations = [0.8, 1.0]
//
//        button.layer.cornerRadius = button.frame.height/ 2.0
//
//        button.layer.maskToBounds = true
//        // Optionally change the direction. The default is vertical.
////        gradientView.direction = .Horizontal
//
//        // Add some borders too if you want
//        gradientView.topBorderColor = UIColor.redColor()
//        gradientView.bottomBorderColor = UIColor.blueColor()
//
//        // Add it as a subview in all of its awesome
//        view.addSubview(gradientView)
//
//
//        gradientLayer.colors = [ firstColor, secondColor]
//
//        gradientLayer.locations = [ 0.0, 1.0]
//
//
////         gradientLayer.frame = CGRect(0, 0, 375, 64)// You can mention frame here
//
//       gradientLayer.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
//
//
//        self.view.layer.addSublayer(gradientLayer)
//        self.setGradientBackground()
//
//    }




//
//    func setGradientBackground() {
//        let colorTop =  UIColor(red: 53.0/255.0, green: 172.0/255.0, blue: 139.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 76.0/255.0, green: 200.0/255.0, blue: 166.0/255.0, alpha: 1.0).cgColor
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [ colorTop, colorBottom]
//        gradientLayer.locations = [ 0.0, 1.0]
//        gradientLayer.frame = self.view.bounds
//
//        self.view.layer.addSublayer(gradientLayer)
//    }



//
//    func addGradient(){
//         let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
//
//        let gradient:CAGradientLayer = CAGradientLayer()
//        gradient.frame.size = self.UIView.frame.size
//        gradient.colors = [UIColor.white.cgColor,UIColor.white.withAlphaComponent(0).cgColor] //Or any colors
//        self.UIView.layer.addSublayer(gradient)
//
//    }

//
//    let firstColor =  UIColor(red: 69/255, green: 90/255, blue: 195/255, alpha: 1.0).cgColor
//
//    let secondColor = UIColor(red: 230/255, green: 44/255, blue: 75/255, alpha: 1.0).cgColor
//
//    let gradientLayer = CAGradientLayer()
//
 
