//
//  SideMenuDetail.swift
//  Success! App
//
//  Created by mac on 19/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class SideMenuDetail: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    var Detail = ["Today","Calender","New Objective/habit","Achievements","Completes Objectives","About","Options","Logo out","Send Feedback"]
    
    var Logo = ["Today","Calendar-1","New-objective","Achievements-1","Completes-objectives","About","Options","Logout","Send-Feedback"]
    
    
    
//    var dictForDetail = NSMutableDictionary()
    
    
    @IBOutlet var slide_img: UIImageView!
    @IBOutlet var userNAME: UILabel!
    @IBOutlet var userEMAIL: UILabel!
    @IBOutlet var slide_Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slide_img.layer.borderWidth = 1
        slide_img.layer.masksToBounds = false
        slide_img.layer.cornerRadius = slide_img.frame.height/2
        slide_img.clipsToBounds = true
        
        
        
        
//        self.slide_Table.isScrollEnabled = false
    }
    
    
        //    that it doesn't displays empty cells at the end of the table.....-->
        
        //    slide_Table.tableFooterView = UIView(frame: .zero)
    
        // Do any additional setup after loading the view.
        
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Detail.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuCell
        
        
        cell.slide_Lbl.text = Detail[indexPath.row]
        cell.slide_Logo.image = UIImage(named: Logo[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            }
}

