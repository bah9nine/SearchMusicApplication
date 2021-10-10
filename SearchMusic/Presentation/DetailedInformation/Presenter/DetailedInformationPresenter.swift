//
//  DetailedInformationDetailedInformationPresenter.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//
import Foundation

class DetailedInformationPresenter: NSObject, DetailedInformationModuleInput, DetailedInformationViewOutput, DetailedInformationInteractorOutput {
    weak var view: DetailedInformationViewInput!
    var interactor: DetailedInformationInteractorInput!
    var router: DetailedInformationRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        view.showActivityIndicatorView()
    }
    
    func showDetailed(album: CollectionID) {
        interactor.getFullInformation(albumId: album)
    }

    func show(_ albumInfo: AlbumInfo) {
        view.updateData(with: albumInfo)
        view.hideActivityIndicatorView()
    }
    
    func reject(with: Error) {
        view.showAlert(title: "OK", massage: with.localizedDescription) { [weak self] in
            if let self = self {
                self.view.dismissViewController()
            }
        }
    }
}
