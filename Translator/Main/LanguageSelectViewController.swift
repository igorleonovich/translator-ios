//
//  LanguageSelectViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class LanguageSelectViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var languages = [Language]()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredLanguages = [Language]()
    
    let core: Core
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    init(core: Core) {
        self.core = core
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LanguageSelectCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        if let languages = Language.getFromJSON() {
            self.languages = languages
        }
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Language"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension LanguageSelectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

extension LanguageSelectViewController: UISearchResultsUpdating {
    
  func updateSearchResults(for searchController: UISearchController) {
//    let searchBar = searchController.searchBar
//    let category = Candy.Category(rawValue:
//      searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
//    filterContentForSearchText(searchBar.text!, category: category)
  }
}
