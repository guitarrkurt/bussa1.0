//
//  SeguroTableViewCell.swift
//  Bussa
//
//  Created by guitarrkurt on 01/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit

class SeguroTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenTip: UIImageView!
    @IBOutlet weak var labelTip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 207/255, green: 243/255, blue: 230/255, alpha: 1.0)
        self.selectedBackgroundView = backgroundView
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
