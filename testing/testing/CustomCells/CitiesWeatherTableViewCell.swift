//
//  CitiesWeatherTableViewCell.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import UIKit

class CitiesWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(city: City){
        nameLabel.text = city.name
        
        guard let cityData = city.cityData else {
            tempLabel.text = "--"
            return
        }
        
        tempLabel.text = "\(cityData.main.temp) °"
        tempIcon.image = UIImage(named: cityData.weather[0].icon)
    }
}
