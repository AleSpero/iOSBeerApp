//
//  BeerViewModel.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 11/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit

class BeerViewModel: BeerViewModelProtocol {
    
    var filter : String?
    var callback : (([Beer]) -> Void)?
    
    required init(responseCallback : (([Beer]) -> Void)?) {
        self.callback = responseCallback
        getBeers(name: nil)
    }
    
    func getBeers(name : String?) {
        NetworkUtils.init().getBeers(beerName: name, brewedBefore: nil, brewedAfter: nil, callback: callback ?? nil)
    }
    

}
