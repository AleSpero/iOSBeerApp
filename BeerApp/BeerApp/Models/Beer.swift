//
//  Beer.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 11/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit

class Beer: Codable {
    let name : String
    let tagline : String
    let firstBrewed : String
    let description : String
    let imgUrl : URL?
    let abv : Double
    
    enum CodingKeys : String, CodingKey{
        case firstBrewed = "first_brewed"
        case imgUrl = "image_url"
        case name
        case tagline
        case description
        case abv
        
    }
}
