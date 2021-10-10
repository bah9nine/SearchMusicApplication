//
//  HistoryHistoryInteractorOutput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import Foundation

protocol HistoryInteractorOutput: AnyObject {
    func show(history: [History])
    func reject(with error: Error)
}
