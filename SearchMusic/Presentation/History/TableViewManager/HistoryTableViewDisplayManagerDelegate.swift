//
//  TableViewDisplayManagerDelegate.swift
//  SearchMusic
//
//  Created by Иван Миронов on 09.10.2021.
//

import Foundation

protocol HistoryTableViewDisplayManagerDelegate: AnyObject {
    func tableViewDisplayManager(_ tableViewDisplayManager: HistoryTableViewDisplayManager, didSelected historyRequest: String)
}
