//
//  SideMenuCell.swift
//  Success! App
//
//  Created by mac on 19/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet var slide_Logo: UIImageView!
    
    @IBOutlet var slide_Lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
