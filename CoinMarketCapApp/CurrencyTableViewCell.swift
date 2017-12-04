//
//  CurrencyTableViewCell.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 04/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import UIKit
import Macaw

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceChangeUsd1hLabel: UILabel!
    @IBOutlet weak var priceChangeUsd24hLabel: UILabel!
    @IBOutlet weak var valueUsdLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
