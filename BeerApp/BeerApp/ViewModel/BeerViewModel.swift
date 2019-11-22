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
    
    required init(name: String?) {
        filter = name
    }
    
    func getBeers() -> Array<Beer> {
        return Array()
    }
    

}
