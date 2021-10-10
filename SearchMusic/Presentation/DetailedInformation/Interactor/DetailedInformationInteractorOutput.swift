//
//  DetailedInformationDetailedInformationInteractorOutput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import Foundation

protocol DetailedInformationInteractorOutput: AnyObject {
    func show(_ albumInfo: AlbumInfo)
    func reject(with: Error)
}
