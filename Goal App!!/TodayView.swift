//
//  TodayView.swift
//  Success! App
//
//  Created by mac on 22/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class TodayView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
   
    
    
    
    
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
    
    

    
    
    
    
    
    
    
    
    @IBAction func plus_BTN(_ sender: Any) {
        
        
        
        let x = self.storyboard?.instantiateViewController(withIdentifier: "AimsView") as? AimsView
        self.navigationController?.pushViewController(x!, animated: true)
        

        
    }
    
    
    
    
    
    
    @IBAction func btn_box(sender: UIButton)
    {
        // Instead of specifying each button we are just using the sender (button that invoked) the method
        if (sender.isSelected == true)
        {
            sender.setBackgroundImage(UIImage(named: "box"), for: UIControlState.normal)
            sender.isSelected = false;
        }
        else
        {
            sender.setBackgroundImage(UIImage(named: "checkBox"), for: UIControlState.normal)
            sender.isSelected = true;
        }
    }
    
    
    
    
    
}
