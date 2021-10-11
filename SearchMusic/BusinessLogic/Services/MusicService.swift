//
//  AlbumsService.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import Foundation

protocol MusicService {
    func getAlbums(for artist: String, completionHandler: @escaping ([Album]?, Error?) -> ())
    func getMusic(by albumId: CollectionID, completionHandler: @escaping (AlbumInfo?, Error?) -> ())
}
