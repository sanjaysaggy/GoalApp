////
////  DateView.swift
////  Success! App
////
////  Created by mac on 23/08/17.
////  Copyright © 2017 ios. All rights reserved.
////
//
//import UIKit
//
//class DateView: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
//
//    
//    
//    @IBOutlet var mytxt: UITextField!
//    
//    
//    @IBOutlet var myPicker: UIPickerView! = UIPickerView()
//    
//    var bizCat = ["One", "Two", "Three","One", "Two", "Three"]
//    
////    var timePicker = UIPickerView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        myPicker.isHidden = true;
//        mytxt.text = bizCat[0]
//        
//        
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//   
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return bizCat.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        return bizCat[row]
//        
//    }
//    
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//       
//        mytxt.text = bizCat[row]
//        myPicker.isHidden = true;
//        
//        
//        
//        
//    }
//    
//    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        
//        myPicker.isHidden = false
//        
//        return false
//    }
//
//}
