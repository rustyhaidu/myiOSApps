//
//  LapTableViewCell.swift
//  Stopwatch
//
//  Created by Alin Zdurlan on 13/10/2018.
//  Copyright © 2018 Alin Zdurlan. All rights reserved.
//

import UIKit

class LapTableViewCell: UITableViewCell {
    @IBOutlet private weak var lapNameLabel: UILabel!
    @IBOutlet private weak var lapTimeLabel: UILabel!
    
    var lapName: String? {
        willSet {
            lapNameLabel.text = newValue
        }
    }
    
    var lapTime: String? {
        willSet {
            lapTimeLabel.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.backgroundColor = .red
        } else {
            self.backgroundColor = .clear
        }
        // Configure the view for the selected state
    }
    

}
