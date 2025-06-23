//
//  DashBoardCell.swift
//  Success! App
//
//  Created by mac on 18/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class DashBoardCell: UITableViewCell {

    @IBOutlet var moreView: UIView!

    @IBOutlet weak var percent_Lbl: UILabel!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.moreView.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

          self.moreView.isHidden = true
        // Configure the view for the selected state
    }

    

    @IBAction func more_Btn(_ sender: Any) {

        if moreView.isHidden {
            
            moreView.isHidden = false
        }else {
            
            moreView.isHidden = true
        }

    
    }
    
    
  
    
    @IBAction func edit_Btn(_ sender: Any) {
    
    }

    @IBAction func delete_Btn(_ sender: Any) {
    }

    
    
 
    @IBAction func percent_Lbl(_ sender: UISlider) {
   
    
//        let rounded = round(100 * sender.value) / 100
//        let final = rounded * 100
//         percent_Lbl.text = "\(final)"
//        print ("value")
    
    percent_Lbl.text = String(Int(sender.value))

     }
    
}

    
    
    

