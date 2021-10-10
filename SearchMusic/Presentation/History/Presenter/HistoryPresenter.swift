//
//  HistoryHistoryPresenter.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

class HistoryPresenter: HistoryModuleInput, HistoryViewOutput, HistoryInteractorOutput {
    weak var view: HistoryViewInput!
    var interactor: HistoryInteractorInput!
    var router: HistoryRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    //take array of histories for displayed
    func getHistoryArray() {
        interactor.getHistory()
    }
    
    func show(history: [History]) {
        view.reloadTableView(with: history)
    }
    
    func reject(with error: Error) {
        view.showAlert(title: "OK", massage: error.localizedDescription, action: nil)
    }
    
    func clearHistory() {
        interactor.clearHistory()
    }
}
