//
//  ElementTableViewCell.swift
//  App5
//
//  Created by Kipras on 3/6/16.
//  Copyright © 2016 Kipras. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var elementTextView: UITextView!

    @IBOutlet weak var checkButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Makes image display in cell to be round.
        checkButton.layer.cornerRadius = checkButton.bounds.size.width / 2.0
        checkButton.layer.masksToBounds = true
        checkButton.layer.borderColor = UIColor.whiteColor().CGColor
        checkButton.layer.borderWidth = 2.0
        checkButton.clipsToBounds = true

        // Configure the view for the selected state
    }

}
