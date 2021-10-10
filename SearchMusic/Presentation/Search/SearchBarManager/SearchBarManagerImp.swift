//
//  SearchBarManagerImp.swift
//  SearchMusic
//
//  Created by Иван Миронов on 08.10.2021.
//

import UIKit

class SearchBarManagerImp: NSObject {
    private let searchBar: UISearchBar!
    weak var delegate: SearchBarManagerDelegate?
    
    init(searchBar: UISearchBar) {
        self.searchBar = searchBar
        super.init()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search albums, artists"
        
    }
    
    //set text in UiSearchBar
    func setTextSearchBar(text: String) {
        searchBar.text = text
    }
}

extension SearchBarManagerImp: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchRequest = searchBar.text, !searchRequest.isEmpty {
            delegate?.searchAlbums(by: searchRequest)
        }
        searchBar.endEditing(true)
    }
}
