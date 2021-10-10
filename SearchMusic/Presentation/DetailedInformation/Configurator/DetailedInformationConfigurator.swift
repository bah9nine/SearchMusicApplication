//
//  DetailedInformationDetailedInformationConfigurator.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class DetailedInformationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailedInformationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailedInformationViewController) {

        let router = DetailedInformationRouter()
        let muiscService = MusicServiceImp.shared

        let presenter = DetailedInformationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailedInformationInteractor()
        interactor.output = presenter
        interactor.service = muiscService

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
        
    }

}
