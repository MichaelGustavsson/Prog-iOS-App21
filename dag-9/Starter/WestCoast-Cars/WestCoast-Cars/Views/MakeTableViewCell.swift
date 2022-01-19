//
//  MakeTableViewCell.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class MakeTableViewCell: UITableViewCell {

    @IBOutlet var makeNameLabel: UILabel!
    @IBOutlet var availabilityLabel: UILabel!
    @IBOutlet var thumbnailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
