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
    
    init(core: Core) {
        self.core = core
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    languages = Language.languages()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Language"
        definesPresentationContext = true
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
