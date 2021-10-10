//
//  SearchSearchViewOutput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

protocol SearchViewOutput {
    func viewIsReady()
    func sendRequest(with text: String)
    func showDetailedInfo(album: CollectionID)
    func saveRequest(text: String)
}
