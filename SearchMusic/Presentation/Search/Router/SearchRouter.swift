//
//  SearchSearchRouter.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//
import ViperMcFlurry

class SearchRouter: SearchRouterInput {
    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol?
    
    func openDetailedInfo(about album: CollectionID) {
        let promisse = transitionHandler?.openModule?(usingSegue: "showDetailed")
        promisse?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as? DetailedInformationModuleInput)?.showDetailed(album: album)
            return nil
        })
    }
}
