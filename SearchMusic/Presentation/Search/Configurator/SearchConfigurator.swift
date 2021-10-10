//
//  SearchSearchConfigurator.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class SearchModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SearchViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SearchViewController) {

        let router = SearchRouter()
        let service = MusicServiceImp.shared
        let historyService = HistoryServiceImp.shared

        let presenter = SearchPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SearchInteractor()
        interactor.output = presenter
        interactor.musicService = service
        interactor.historyService = historyService

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
        
        router.transitionHandler = viewController
    }

}
