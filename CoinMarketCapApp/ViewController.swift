//
//  ViewController.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 03/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import UIKit
import Moya
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifier = "currencyCell"
    
    let disposeBag = DisposeBag()
    let provider = MoyaProvider<CoinMarketCap>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        provider.rx.request(.ticker(start: 0, limit: 0))
            .debug()
            .map([Currency].self)
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: self.cellIdentifier)) { index, model, cell in
                cell.textLabel!.text = model.Symbol
                cell.detailTextLabel!.text = model.Name
            
            }
            .disposed(by: self.disposeBag)
    }
}

