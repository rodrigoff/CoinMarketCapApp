//
//  CurrencyViewModel.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 06/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import Foundation
import Moya
import RxSwift

final class CurrencyViewModel {
    
    let provider = MoyaProvider<CoinMarketCap>()
 
    func getCurrencies() -> Observable<[Currency]> {
        return provider.rx.request(.ticker(start: 0, limit: 0))
            .debug()
            .map([Currency].self)
            .asObservable()
    }
    
}
