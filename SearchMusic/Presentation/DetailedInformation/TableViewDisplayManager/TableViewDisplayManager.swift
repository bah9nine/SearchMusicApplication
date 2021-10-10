//
//  TableViewDisplayManager.swift
//  SearchMusic
//
//  Created by Иван Миронов on 08.10.2021.
//

import Foundation

protocol TableViewDisplayManager {
    func reloadData(with tracks: [Track])
}
