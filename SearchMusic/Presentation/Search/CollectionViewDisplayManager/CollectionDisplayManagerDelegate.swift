//
//  CollectionDisplayManagerDelegate.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import Foundation

protocol CollectionDisplayManagerDelegate: AnyObject {
    func collectioDisplayManager(_ collectionDisplayManager: CollectionDisplayManager, didSelected album: CollectionID)
    func endEdidting(_ collectionDisplayManager: CollectionDisplayManager)
}
