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
            .bind(to: tableView.rx.items(cellIdentifier: self.cellIdentifier, cellType: CurrencyTableViewCell.self)) { index, model, cell in
                cell.symbolLabel!.text = model.Symbol
                cell.nameLabel!.text = model.Name
                cell.valueUsdLabel!.text = "USD \(String(format: "%.2f", model.PriceUsd))"
                cell.priceChangeUsd1hLabel!.text = "\(String(format: "%.2f", model.PercentChange1h)) %"
                cell.priceChangeUsd24hLabel!.text = "\(String(format: "%.2f", model.PercentChange24h)) %"
                if let icon = UIImage(named: model.Symbol) {
                    cell.iconImageView!.image = icon
                    cell.iconImageView!.alpha = 1
                } else {
                    cell.iconImageView!.image = UIImage(named: "BTC")
                    cell.iconImageView!.alpha = 0.5
                }
            }
            .disposed(by: self.disposeBag)

        tableView.rx.modelSelected(Currency.self)
            .subscribe(onNext: { currency in
                self.performSegue(withIdentifier: "showDetails", sender: currency)
            })
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "showDetails":
            if let detailsViewController = segue.destination as? DetailsViewController {
                detailsViewController.currency = sender as? Currency
            }
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
}

