//
//  HistoryHistoryConfigurator.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class HistoryModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? HistoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HistoryViewController) {

        let router = HistoryRouter()
        let historyService = HistoryServiceImp.shared

        let presenter = HistoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HistoryInteractor()
        interactor.output = presenter
        interactor.historyService = historyService

        presenter.interactor = interactor
        viewController.output = presenter
        
    }

}
