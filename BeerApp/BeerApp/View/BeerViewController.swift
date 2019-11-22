//
//  BeerViewController.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 11/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var beers : Array<String> = Array()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Esplosione
        NetworkUtils.init().getBeers(beerName: nil, brewedBefore: nil, brewedAfter: nil, callback: {
            beer in
            
        })
        
        for i in 0...10 {
            beers.append("Beer \(i)")
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = beers[indexPath.row]

        return cell
    }
    

}
