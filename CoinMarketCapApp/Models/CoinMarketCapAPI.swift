//
//  CoinMarketCapAPI.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 03/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import Foundation
import Moya

let coinMarketCapProvider = MoyaProvider<CoinMarketCap>()

public enum CoinMarketCap {
    case ticker(start: Int?, limit: Int?)
}

extension CoinMarketCap : TargetType {
    public var baseURL: URL { return URL(string: "https://api.coinmarketcap.com")! }
    
    public var path: String {
        switch self {
        case .ticker: return "/v1/ticker"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .ticker: return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .ticker: return Data(base64Encoded: "")!
        }
    }
    
    public var task: Task {
        switch self {
        case .ticker: return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Accept": "application/json", "Content-type": "application/json"]
    }
    
}
