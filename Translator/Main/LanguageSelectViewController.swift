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
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredLanguages = [Language]()
    
    let core: Core
    let completion: (Language) -> Void
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    init(core: Core, completion: @escaping (Language) -> Void) {
        self.core = core
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Settings.basicColor
        tableView.backgroundColor = Settings.basicColor
        
        let nib = UINib(nibName: "LanguageSelectCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Language"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension LanguageSelectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LanguageSelectCell {
            cell.backgroundColor = .clear
            cell.backgroundView = UIView()
            cell.selectedBackgroundView = UIView()
            cell.setup(language: Settings.languages[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension LanguageSelectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completion(Settings.languages[indexPath.row])
        dismiss(animated: true, completion: nil)
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
