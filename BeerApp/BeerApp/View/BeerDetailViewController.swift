//
//  BeerDetailViewController.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 26/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    var currentBeer : Beer? = nil
    
    @IBOutlet weak var beerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerName.text = currentBeer?.name

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
