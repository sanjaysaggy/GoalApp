//
//  CalendarView.swift
//  Goal App!!
//
//  Created by mac on 14/09/17.
//  Copyright © 2017 mac. All rights reserved.
//
import UIKit
import FSCalendar

class CalendarView: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    
    @IBOutlet weak var objective_View: UIView!
    
    @IBOutlet weak var CalendarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FSCalendar"
        
        self.objective_View.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
        print("date")
        
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
    

        
    @IBAction func Key_BTN(_ sender: Any) {
    
        self.objective_View.isHidden = false
    }
    
    @IBAction func Cancel_ObjectView(_ sender: Any) {
        
        
        self.objective_View.isHidden = true

        
    }
    
}
