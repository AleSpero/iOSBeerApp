//
//  BeerViewModelProtocol.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 11/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit

protocol BeerViewModelProtocol: class {
    init(responseCallback : (([Beer]) -> Void)?)
    func getBeers(name : String?)
    
}
