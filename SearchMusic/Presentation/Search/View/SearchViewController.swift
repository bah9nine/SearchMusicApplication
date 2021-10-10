//
//  SearchSearchViewController.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController, SearchViewInput {
 
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var output: SearchViewOutput!
    private var displayManager: CollectionDisplayManager?
    private var searchManager: SearchBarManagerImp?
    @IBOutlet weak var emptyListContainerView: UIView!
    private var activityIndicatorView: ActivityIndicatorView?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: SearchViewInput
    func setupInitialState() {
        displayManager = CollectionDisplayManagerImp(collectionView: collectionView)
        searchManager = SearchBarManagerImp(searchBar: searchBar)
        searchManager?.delegate = self
        displayManager?.delegate = self
        activityIndicatorView = ActivityIndicatorView(view: view)
    }
    
    func reloadCollectionView(with albums: [Album]) {
        displayManager?.reloadData(with: albums)
        emptyListContainerView.isHidden = true
    }
    
    func openHistory(search: String) {
        searchManager?.setTextSearchBar(text: search)
        output.sendRequest(with: search)
    }
    
    func startActivityIndicator() {
        emptyListContainerView.isHidden = true
        activityIndicatorView?.showActivityIndicator()
        collectionView.isHidden = true
    }
    
    func stopActivityIndicator() {
        activityIndicatorView?.hideActivityIndicator()
        collectionView.isHidden = false
    }
    
    func defaultState() {
        activityIndicatorView?.hideActivityIndicator()
        emptyListContainerView.isHidden = false
        searchManager?.setTextSearchBar(text: "")
    }
    
}

extension SearchViewController: SearchBarManagerDelegate {
    func searchAlbums(by text: String) {
        output.sendRequest(with: text)
        output.saveRequest(text: text)
    }
}

extension SearchViewController: CollectionDisplayManagerDelegate {
    func collectioDisplayManager(_ collectionDisplayManager: CollectionDisplayManager, didSelected album: CollectionID) {
        output.showDetailedInfo(album: album)
    }
    
    func endEdidting(_ collectionDisplayManager: CollectionDisplayManager) {
        view.endEditing(true)
    }
}
