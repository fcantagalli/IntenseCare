//
//  CellHomeTableViewCell.swift
//  IntenseCare
//
//  Created by Felipe on 5/23/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import Foundation

class CellHomeTableViewCell:UITableViewCell {
    
    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var PatientName: UILabel!
    @IBOutlet weak var SOFAValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}