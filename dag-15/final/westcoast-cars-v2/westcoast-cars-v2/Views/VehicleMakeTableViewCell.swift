//
//  VehicleTableViewCell.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-02-01.
//

import UIKit

class VehicleMakeTableViewCell: UITableViewCell {
    
    @IBOutlet var imageViewContainer: UIView!
    @IBOutlet var vehicleImage: UIImageView!
    @IBOutlet var detailInfoLabel: UILabel!
    @IBOutlet var vehicleInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
