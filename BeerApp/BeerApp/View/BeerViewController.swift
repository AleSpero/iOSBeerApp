//
//  BeerViewController.swift
//  BeerApp
//
//  Created by Alessandro Sperotti on 11/11/2019.
//  Copyright © 2019 Alessandro Sperotti. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
        
    var beers : [Beer] = Array() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    var beerViewModel : BeerViewModel? = nil
    var searchController : UISearchController? = nil
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerViewModel = BeerViewModel.init(responseCallback: { beers in
            self.beers = beers
        })
    
        setupSearchBar()
        
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
        cell.textLabel?.text = beers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "beerDetail", sender: self)
    }
    
    func setupSearchBar(){
        searchBar.placeholder = "Search Beers..."
        searchBar.delegate = self
    }
    
    func updateSearchResults(for searchController : UISearchController){
        guard let text = searchController.searchBar.text else{ return }
        
        debugPrint(text)
        
        if !text.isEmpty {
        beerViewModel?.getBeers(name: text)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        beerViewModel?.getBeers(name: searchText.isEmpty ? "" : searchText)
    }
    

}
