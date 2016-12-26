//
//  BookTableViewCell.swift
//  vorkosigan
//
//  Created by Grace O'Hair-Sherman on 12/11/15.
//  Copyright (c) 2015 Grace O'Hair-Sherman. All rights reserved.
//

import UIKit

class OmnibusTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coverImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameLabel.text = "hello"
        //self.coverImg = image(named:)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
