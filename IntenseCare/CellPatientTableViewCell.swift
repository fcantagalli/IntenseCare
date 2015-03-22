//
//  CellPatientTableViewCell.swift
//  IntenseCare
//
//  Created by Bianca Letti on 22/03/15.
//  Copyright (c) 2015 felanca. All rights reserved.
//

import UIKit

class CellPatientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientBed: UILabel!
    @IBOutlet weak var patientStatus: UIImageView!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
