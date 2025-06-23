//
//  DashBoardView.swift
//  Success! App
//
//  Created by mac on 18/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class DashBoardView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var hamburgerBTN: UIBarButtonItem!
    
    @IBOutlet var myTableDashBoard: UITableView!
    
    
    
//    @IBOutlet var moreBtnView: UIView!
    var objects = ["","","","","","","","","","","","","","","","","","",""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
   
        
        //
//        if self.revealViewController() != nil {
//            hamburgerBTN.target = self.revealViewController()
//            hamburgerBTN.action = Selector(("revealToggle:"))
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
//        
        
        
        
//        hamburgerBTN.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardCell", for: indexPath)
        
        
        return cell
}

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
//    tableView.deselectRow(at: indexPath, animated: true)
        
                
        myTableDashBoard.reloadData()
        
//        let selectedRowIndex = indexPath
//        currentRow = selectedRowIndex.row
    }
    
    
    
//    
//    func sliderValueChange(sender: UISlider) {
//        // Get the sliders value
//        var currentValue = Int(sender.value)
//        var sliderRow = sender.tag
//        
//        // Do whatever you want with the value :)
//        // And now the row of the slider!
//    }
    
    
    
    
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
    
    
    @IBAction func TodayBTN(_ sender: Any) {
        
        
        
        
            
            
            let x = self.storyboard?.instantiateViewController(withIdentifier: "TodayView") as? TodayView
            self.navigationController?.pushViewController(x!, animated: true)
   
        
        
        
    }
    
    
    
    
    
//  UISLIDER settings.....>
    
    

    

    
    
}






