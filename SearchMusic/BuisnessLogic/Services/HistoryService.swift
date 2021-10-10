//
//  HistoryService.swift
//  SearchMusic
//
//  Created by Иван Миронов on 09.10.2021.
//

import Foundation

protocol HistoryService {
    func saveSearch(request: String) throws
    func getHistory(completionHandler: @escaping ([History]?, Error?) -> ())
    func clearHistory() throws
}
