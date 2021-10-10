//
//  DetailedInformationDetailedInformationModuleInput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//
import ViperMcFlurry

protocol DetailedInformationModuleInput: AnyObject, RamblerViperModuleInput {
    func showDetailed(album: CollectionID)
}
