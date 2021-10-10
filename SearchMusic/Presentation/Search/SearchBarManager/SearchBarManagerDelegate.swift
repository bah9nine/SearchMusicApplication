//
//  SearchBarManager.swift
//  SearchMusic
//
//  Created by Иван Миронов on 08.10.2021.
//

import Foundation

protocol SearchBarManagerDelegate: AnyObject {
    func searchAlbums(by text: String)
}
