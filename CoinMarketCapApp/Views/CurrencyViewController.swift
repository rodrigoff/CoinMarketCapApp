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

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    let viewModel = CurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getCurrencies()
            .bind(to: tableView.rx.items(cellIdentifier: CurrencyTableViewCell.Identifier, cellType: CurrencyTableViewCell.self)) { index, model, cell in
                cell.currency = model
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

