//
//  BeerUtils.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 11/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit
import Alamofire

class NetworkUtils: NSObject {
    
    public static func getPunkApiEndpoint() -> String{
        return "https://api.punkapi.com/v2/"
    }
    
    func getBeers(beerName : String?, brewedBefore : String?, brewedAfter : String?, callback : (([Beer]) -> Void)?) {
        
        var responseBeers : [Beer] = []
        
        //TODO PARAMETERS
        AF.request("https://api.punkapi.com/v2/beers?",
                   parameters: beerName?.isEmpty ?? true ? nil : ["beer_name": beerName] 
        ).responseJSON { response in
        
            switch(response.result){
            case .success(let jsonResponse):
                let jsonDecoder = JSONDecoder.init()
        
                debugPrint(jsonResponse)
                let beers = jsonResponse as! NSArray
                
                for beer in beers{
                    do {
                        let serializedResponse = try JSONSerialization.data(withJSONObject: beer, options: [])
                        responseBeers.append(try jsonDecoder.decode(Beer.self, from: serializedResponse))
                    }
                    catch(let e){
                    debugPrint(e)
                    }
                }
                break
                
            case .failure(let error):
                debugPrint(error)
                break
            }
            
            callback?(responseBeers)
        }
        
    }

}
