//
//  HabitAimView.swift
//  Success! App
//
//  Created by mac on 23/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit


class AimsView: UIViewController,UITextFieldDelegate,UIPickerViewDelegate {

    @IBOutlet var mySCROLLview: UIScrollView!
    
    
    @IBOutlet var aimName: UITextField!
    
  
    @IBOutlet weak var descript: UITextField!
    
    @IBOutlet var startDate: UITextField!
    
    
    @IBOutlet var endDate: UITextField!
    
    
    @IBOutlet var Name_chal: UITextField!
    
    @IBOutlet var descript_chal: UITextField!
    
    @IBOutlet var Date_chal: UITextField!
    
    
    @IBOutlet var mySwitch: UISwitch!
  
    @IBOutlet var one_PIKR: UIPickerView!
    
    @IBOutlet var two_PIKR: UIPickerView!
    
    @IBOutlet var third_PIKR: UIDatePicker!
    
    @IBOutlet var hiddenView_toTIME: UIView!
    
    
    
     var iPhones = ["Daily", "Weekly"]
     var colors = ["1","22-99-99","3","4","5","6","7","8","9","10","11","12","13", "14"]
     var timing = ["UDaily", "UWeekly"]
    
    @IBOutlet var habit_Img: UIImageView!
    
    @IBOutlet var aim_Img: UIImageView!

 
    override func viewDidLayoutSubviews()
    {
        self.mySCROLLview.contentSize = CGSize(width: self.view.frame.size.width, height: 600) // height change according
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
 //        calender IMAGE FOR Start-->
        
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "Calendar-darkblack")
        rightImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)

        
        let rightView = UIView()
        rightView.addSubview(rightImageView)
        rightView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        startDate.rightViewMode = UITextFieldViewMode.always
        startDate.rightView = rightView

        
        
//        calender IMAGE FOR END -->
        
        let rightImageViews = UIImageView()
        rightImageViews.image = UIImage(named: "Calendar-darkblack")
        rightImageViews.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        
        
        let endrightView = UIView()
        endrightView.addSubview(rightImageViews)
        endrightView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        endDate.rightViewMode = UITextFieldViewMode.always
        endDate.rightView = endrightView
        

//        calender IMAGE FOR DATE -->
        
        let rightImageViewss = UIImageView()
        rightImageViewss.image = UIImage(named: "Calendar-darkblack")
        rightImageViewss.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        
        
        let datrightView = UIView()
        datrightView.addSubview(rightImageViews)
        datrightView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        endDate.rightViewMode = UITextFieldViewMode.always
        endDate.rightView = datrightView

        
        
        
        
        
        mySCROLLview.showsVerticalScrollIndicator = false
        
        self.hiddenView_toTIME.isHidden = true
        
//        let iPhonePickerView = UIPickerView()
//        
//        iPhonePickerView.delegate = self
//        
//        iPhonePickerView.tag = 1
//        
//        mytxt.inputView = iPhonePickerView
//        
//        let colorPickerView = UIPickerView()
//        
//        colorPickerView.delegate = self
//        
//        colorPickerView.tag = 2
//        
//        dayWeek.inputView = colorPickerView

        
//        let mycolorPickerView = UIPickerView()
//        
//        colorPickerView.delegate = self
//        
//        colorPickerView.tag = 2
//        
//        colorTextField.inputView = colorPickerView
        

        
        
        
        habit_Img.layer.borderWidth = 1
        habit_Img.layer.masksToBounds = false
        habit_Img.layer.cornerRadius = habit_Img.frame.height/2
        habit_Img.clipsToBounds = true
        
        
        
        aim_Img.layer.borderWidth = 1
        aim_Img.layer.masksToBounds = false
        aim_Img.layer.cornerRadius = habit_Img.frame.height/2
        aim_Img.clipsToBounds = true
        
//self.handleDatePicker.datePickerView = .time
        
//        one_PIKR.isHidden = true;
//        two_PIKR.isHidden = true;
//        third_PIKR.isHidden = true;
//      
//        one_PIKR.tag = 1
//        two_PIKR.tag = 2
//        third_PIKR.tag = 3

        
//        myTime.inputView = one_PIKR
//        dayWeek.inputView = two_PIKR
//      
        
       }

    
    

    
    
        func textFieldValidation() -> Bool{
    
            if Name_chal.text == "" {
    
                GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Please Enter Challenge Name", on: self)
            return true
            }
    
            if Date_chal.text == "" {
    
            GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Please Enter Challenge Date", on: self)
    
                return true
            }
    
        
            
        return true
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func switchChanged(_ mySwitch: UISwitch) {
        if mySwitch.isOn {
            // handle on
        } else {
            // handle off
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        
//        if pickerView.tag == 1 {
//            
//            return iPhones.count
//            
//        }
//        
//        if pickerView.tag == 2 {
//            
//            return colors.count
//            
//        }
//        
//        return 0
//        
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        if pickerView.tag == 1 {
//            
//            return iPhones[row]
//            
//        }
//        
//        if pickerView.tag == 2 {
//            
//            return colors[row]
//            
//        }
//        
//        return nil
//        
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//        if pickerView.tag == 1 {
//            
//            mytxt.text = iPhones[row]
//            self.view.endEditing(true)
//        }
//        
//        if pickerView.tag == 2 {
//            
//            dayWeek.text = colors[row]
//            self.view.endEditing(true)
//        }
//    }

    
    
    @IBAction func dp(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
//        .addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        
    }
    
//    func handleDatePicker(sender: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        self.handleDatePicker.datePickerMode = .time
//        
//        dateFormatter.dateFormat = "dd MMM yyyy"
//        myTime.text = dateFormatter.string(from: sender.date)
//    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd MMM yyyy"
        Date_chal.text = dateFormatter.string(from: sender.date)
        self.view.endEditing(true)

    }
    
    
    
    @IBAction func mp(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        //        .addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        
    }
    

    
    func mydatePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        startDate.text = dateFormatter.string(from: sender.date)
        self.view.endEditing(true)
        
    }

    
    
    
    
    @IBAction func np(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        //        .addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        
    }
    
    
    
    func enddatePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        endDate.text = dateFormatter.string(from: sender.date)
        self.view.endEditing(true)
        
    }
    

    
    

    
//    func donedatePicker(){
//        //For date formate
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        myTime.text = formatter.string(from: third_PIKR.date)
//        //dismiss date picker dialog
//        self.view.endEditing(true)
//    }
//    
//    func cancelDatePicker(){
//        //cancel button dismiss datepicker dialog
//        self.view.endEditing(true)
//    }
//
    
    
    
    @IBAction func mySwitch(_ sender: UISwitch) {
        
        if (sender.isOn == true) {
        
            
           self.hiddenView_toTIME.isHidden = true
            
        }
        else {
            
            self.hiddenView_toTIME.isHidden = false
        }
    }
    
    
    @IBAction func habit_BTN(_ sender: Any) {
        
        
        let x = self.storyboard?.instantiateViewController(withIdentifier: "HabitsView") as? HabitsView
        self.navigationController?.pushViewController(x!, animated: true)
        

        
        
    }
    
    
    
    
    
    
    
    @IBAction func calendar(_ sender: Any) {
        
        let x = self.storyboard?.instantiateViewController(withIdentifier: "CalendarView") as? CalendarView
        self.navigationController?.pushViewController(x!, animated: true)
        
        
        
    }
    
    @IBAction func Achievement(_ sender: Any) {
        
        
        let y = self.storyboard?.instantiateViewController(withIdentifier: "AchievementView") as? AchievementView
        self.navigationController?.pushViewController(y!, animated: true)
        
    }
    
    @IBAction func home(_ sender: Any) {
        
        
        let z = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardView") as? DashBoardView
        self.navigationController?.pushViewController(z!, animated: true)
        
        
    }






@IBAction func save_Btn(_ sender: Any) {
print("btn Pressed")
//    
//    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "Congratulations", andMessage: "Your Data is Saved", on: self)
//
//
//
// //http://mobileappdevelop.co/SUCCESS/webservice/add_aim?user_id=1&aim_name=abc&description=dgsdg&start_date=2017-08-12&end_date=2017-01-25&challenge_name=xyz&challenge_date=2018-04-23&challenge_description=gdgsgg
//
//
//
//    
//
//
//    WebHelper.requestPostUrl("http://mobileappdevelop.co/SUCCESS/webservice/add_aim?user_id=\(UserDefaults.standard.value(forKey: "userID")!)&aim_name=\(aimName.text!)&description=\(descript.text!)&start_Date=\(startDate.text!)&end_Date=\(endDate.text!)&challenge_Name=\(Name_chal.text!)&challenge_Date=\(Date_chal.text!)&challenge_description=\(descript_chal.text!)",controllerView: self, success: {(_ respon: [AnyHashable: Any]) -> Void in
//
//    
//    //success
//    
//    let responseDict = respon as NSDictionary
//    print("respon:\(responseDict)")
//    
//    
//    
//    if responseDict.count == 0
//    {
//    
//    DispatchQueue.main.async {
//    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server not Found 1", on: self)
//    }
//    
//    }else {
//    let status : String = responseDict["message"] as! String
//    if status == "successfull" {
//    // Bounce back to the main thread to update the UI
//    DispatchQueue.main.async {
//    
//    
//    let userDict = responseDict.value(forKey: "result") as! NSDictionary
//    UserDefaults.standard.set(userDict.value(forKey: "id"), forKey: "userID")
//    
//    
//
//    
//    }
//    }
//    else{
//    DispatchQueue.main.async {
//    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "No Data Found! 2", on: self)
//    }
//    }
//    }
//    
//    
//    
//    
//    }, failure: {(_error: Error?) -> Void in
//    //error
//    
//    DispatchQueue.main.async {
//    GlobalConstant.showAlertMessage(withOkButtonAndTitle: "", andMessage: "Server Not Found 3", on: self)
//    }
//    
//    
//    })
//    
}
   

    
    
    
    @IBAction func add_Challenges(_ sender: Any) {
   
       self.textFieldValidation()
        
        
        
    
    
    }
    
    

}


    
    
