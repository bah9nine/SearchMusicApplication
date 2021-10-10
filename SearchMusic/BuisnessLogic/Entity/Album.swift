//
//  Album.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import Foundation
import ObjectMapper
import Kingfisher

struct Album: ImmutableMappable {
    let artistName: String
    let albumName: String
    let albumImage: URL
    let albumId: CollectionID
    
    init(map: Map) throws {
        artistName = try map.value("artistName")
        albumName = try map.value("collectionName")
        albumId = try map.value("collectionId")
        let stringUrl: String = try map.value("artworkUrl100")
        guard let url = URL(string: stringUrl) else {
            throw SystemErrors.mappingError
        }
        albumImage = url
    }
}

typealias CollectionID = Int
