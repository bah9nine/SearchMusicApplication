//
//  CollectionDisplayManager.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import UIKit

protocol CollectionDisplayManager {
    func reloadData(with albums: [Album])
    var delegate: CollectionDisplayManagerDelegate? { get set }
}

