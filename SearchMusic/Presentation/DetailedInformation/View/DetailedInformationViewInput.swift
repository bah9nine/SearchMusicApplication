//
//  DetailedInformationDetailedInformationViewInput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

protocol DetailedInformationViewInput: AnyObject, BaseViewInput {

    func updateData(with albumInfo: AlbumInfo)
    func setupInitialState()
    func showActivityIndicatorView()
    func hideActivityIndicatorView()
    func dismissViewController() 
}
