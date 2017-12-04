//
//  Currency.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 03/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import Foundation

struct Currency: Codable {
    var Id: String
    var Name: String
    var Symbol: String
    var Rank: String
    var PriceUsd: String
    var PriceBtc: String
    var LastDayVolumeUsd: String
    var MarketCapUsd: String
    var AvailableSupply: String
    var TotalSupply: String
    var PercentChange1h: String
    var PercentChange24h: String
    var PercentChange7d: String
    var LastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case Name = "name"
        case Symbol = "symbol"
        case Rank = "rank"
        case PriceUsd = "price_usd"
        case PriceBtc = "price_btc"
        case LastDayVolumeUsd = "24h_volume_usd"
        case MarketCapUsd = "market_cap_usd"
        case AvailableSupply = "available_supply"
        case TotalSupply = "total_supply"
        case PercentChange1h = "percent_change_1h"
        case PercentChange24h = "percent_change_24h"
        case PercentChange7d = "percent_change_7d"
        case LastUpdated = "last_updated"
    }
}
