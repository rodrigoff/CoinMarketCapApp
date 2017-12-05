//
//  DetailsViewController.swift
//  CoinMarketCapApp
//
//  Created by Rodrigo F. Fernandes on 05/12/17.
//  Copyright © 2017 Rodrigo F. Fernandes. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var currency: Currency?
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currency = currency {
            title = currency.Symbol
            iconImageView.image = UIImage(named: currency.Symbol)
            nameLabel.text = currency.Name
        }
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
