//
//  SearchSearchViewInput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

protocol SearchViewInput: AnyObject, BaseViewInput {
    func setupInitialState()
    func reloadCollectionView(with albums: [Album])
    func startActivityIndicator()
    func stopActivityIndicator()
    func defaultState() 
}
