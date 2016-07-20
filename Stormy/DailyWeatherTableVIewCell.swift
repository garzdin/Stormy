//
//  DailyWeatherTableVIewCell.swift
//  Stormy
//
//  Created by Teodor on 14/02/16.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class DailyWeatherTableVIewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
