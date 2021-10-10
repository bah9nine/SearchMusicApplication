//
//  SearchSearchInteractorInput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import Foundation

protocol SearchInteractorInput {
    func getAlbums(by text: String)
    func saveRequest(text: String)
}
