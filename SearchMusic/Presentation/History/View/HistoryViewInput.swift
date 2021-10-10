//
//  HistoryHistoryViewInput.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

protocol HistoryViewInput: AnyObject, BaseViewInput {
    func setupInitialState()
    func reloadTableView(with histories: [History])
}
