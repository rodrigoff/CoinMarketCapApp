//
//  Currency.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 03/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import Foundation

class Currency: Decodable {
    var Id: String
    var Name: String
    var Symbol: String
    var Rank: String
    
    lazy var PriceUsd: Float = Float(price_usd) ?? 0
    var price_usd: String
    
    lazy var PriceBtc: Float = Float(price_btc) ?? 0
    var price_btc: String
    
    var LastDayVolumeUsd: String
    
    var MarketCapUsd: String
    
    lazy var AvailableSupply: Float = Float(available_supply) ?? 0
    var available_supply: String
    
    lazy var TotalSupply: Float = Float(total_supply) ?? 0
    var total_supply: String
    
    lazy var PercentChange1h: Float = Float(percent_change_1h) ?? 0
    var percent_change_1h: String
    
    lazy var PercentChange24h: Float = Float(percent_change_24h) ?? 0
    var percent_change_24h: String

    
    lazy var PercentChange7d: Float = Float(percent_change_7d) ?? 0
    var percent_change_7d: String
    
    var LastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case Name = "name"
        case Symbol = "symbol"
        case Rank = "rank"
        case price_usd = "price_usd"
        case price_btc = "price_btc"
        case LastDayVolumeUsd = "24h_volume_usd"
        case MarketCapUsd = "market_cap_usd"
        case available_supply = "available_supply"
        case total_supply = "total_supply"
        case percent_change_1h = "percent_change_1h"
        case percent_change_24h = "percent_change_24h"
        case percent_change_7d = "percent_change_7d"
        case LastUpdated = "last_updated"
    }
}
