//
//  HistoryServiceImp.swift
//  SearchMusic
//
//  Created by Иван Миронов on 09.10.2021.
//

import UIKit
import CoreData

class HistoryServiceImp: HistoryService {
    static let shared = HistoryServiceImp()
    private var context: NSManagedObjectContext!
    private var historyArray: [History] = []
    private init() {
        context = getContext()
    }
    
    func saveSearch(request: String) throws {
       if !isExist(history: request) {
            let requestHistory = History(context: context)
            requestHistory.requestHistory = request
        
            try context.save()
        }
    }
    
    func getHistory(completionHandler: @escaping ([History]?, Error?) -> ())  {
        do {
            let historiesArray =  try context.fetch(History.fetchRequest()) as? [History]
            self.historyArray = historiesArray?.reversed() ?? []
            completionHandler(historiesArray?.reversed(), nil)
        } catch {
            completionHandler(nil, error)
        }
    }
    
    func clearHistory() throws {
        historyArray.forEach { history in
            context.delete(history)
        }
        try context.save()
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    private func isExist(history: String) -> Bool {
        return historyArray.contains { item in
            return item.requestHistory == history
        }
    }
}
