//
//  CurrencyTableViewCell.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 04/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import UIKit

final class CurrencyTableViewCell: UITableViewCell {

    static var Identifier = "CurrencyTableViewCell"
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceChangeUsd1hLabel: UILabel!
    @IBOutlet weak var priceChangeUsd24hLabel: UILabel!
    @IBOutlet weak var valueUsdLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var currency: Currency? {
        didSet {
            guard let currency = currency else { return }
            symbolLabel!.text = currency.Symbol
            nameLabel!.text = currency.Name
            valueUsdLabel!.text = "USD \(String(format: "%.2f", currency.PriceUsd))"
            priceChangeUsd1hLabel!.text = "\(String(format: "%.2f", currency.PercentChange1h)) %"
            priceChangeUsd24hLabel!.text = "\(String(format: "%.2f", currency.PercentChange24h)) %"
            if let icon = UIImage(named: currency.Symbol) {
                iconImageView!.image = icon
                iconImageView!.alpha = 1
            } else {
                iconImageView!.image = UIImage(named: "BTC")
                iconImageView!.alpha = 0.5
            }
        }
    }
        
}
