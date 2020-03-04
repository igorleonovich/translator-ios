//
//  LanguageSelectViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 3/3/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class LanguageSelectViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var realSearchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredLanguages = [Language]()
    
    let core: Core
    var selectedLanguage: Language
    let completion: (Language) -> Void
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    init(core: Core, selectedLanguage: Language, completion: @escaping (Language) -> Void) {
        self.core = core
        self.selectedLanguage = selectedLanguage
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LanguageSelectCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Language"
        realSearchBar = searchController.searchBar
        searchBar.addSubview(realSearchBar)
        
        realSearchBar.barTintColor = Settings.basicColor
        realSearchBar.tintColor = UIColor.Blue.DeepSkyBlue
        realSearchBar.searchTextField.textColor = Settings.colorMode == .light ? .black : UIColor.Blue.LilyWhite
        
        view.backgroundColor = Settings.basicColor
        tableView.backgroundColor = Settings.basicColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let index = Settings.languages.firstIndex(of: selectedLanguage) {
            tableView.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .middle)
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredLanguages = Settings.languages.filter { language in
            if isSearchBarEmpty {
                return true
            } else {
                return language.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}

extension LanguageSelectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredLanguages.count
        }
        return Settings.languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LanguageSelectCell {
            cell.backgroundColor = .clear
            cell.backgroundView = UIView()
            let selectedBackgroundView = UIView()
            selectedBackgroundView.backgroundColor = UIColor.Blue.DeepSkyBlue
            cell.selectedBackgroundView = selectedBackgroundView
            if isFiltering {
                cell.setup(language: filteredLanguages[indexPath.row])
            } else {
                cell.setup(language: Settings.languages[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension LanguageSelectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            completion(filteredLanguages[indexPath.row])
        } else {
            completion(Settings.languages[indexPath.row])
        }
        searchController.isActive = false
        dismiss(animated: true)
    }
}

extension LanguageSelectViewController: UISearchResultsUpdating {
    
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchText: searchBar.text!)
  }
}
