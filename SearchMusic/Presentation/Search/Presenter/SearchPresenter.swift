//
//  SearchSearchPresenter.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//
import Foundation

class SearchPresenter: NSObject, SearchModuleInput, SearchViewOutput, SearchInteractorOutput {
    weak var view: SearchViewInput!
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func sendRequest(with text: String) {
        view.startActivityIndicator()
        interactor.getAlbums(by: text)
    }
    
    func getData(albums: [Album]) {
        view.reloadCollectionView(with: albums)
        view.stopActivityIndicator()
    }
    
    func reject(with error: Error) {
        view.showAlert(title: "OK", massage: error.localizedDescription, action: nil)
        view.defaultState()
    }
    
    func showDetailedInfo(album: CollectionID) {
        router.openDetailedInfo(about: album)
    }
    
    func saveRequest(text: String) {
        interactor.saveRequest(text: text)
    }
    
}
