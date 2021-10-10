//
//  HistoryHistoryInteractor.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

class HistoryInteractor: HistoryInteractorInput {

    weak var output: HistoryInteractorOutput!
    var historyService: HistoryService!
    
    func getHistory() {
        historyService.getHistory { [weak self] (historyArray, error) in
            guard let self = self else { return }
            
            if let history = historyArray {
                self.output.show(history: history)
            }
            if let error = error {
                self.output.reject(with: error)
            }
        }
    }
    
    func clearHistory() {
        do {
          try historyService.clearHistory()
        } catch {
            output.reject(with: error)
        }
    }
}
