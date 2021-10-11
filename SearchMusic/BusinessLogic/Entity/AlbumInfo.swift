//
//  Music.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import Foundation
import ObjectMapper

struct AlbumInfo: ImmutableMappable {
    let artistName: String
    let collectionName: String
    var tracks: [Track]?
    let albumImage: URL
    let releaseDate: String
    let genre: String
    
    init(map: Map) throws {
        artistName = try map.value("artistName")
        collectionName = try map.value("collectionName")
        let imageUrl: String = try map.value("artworkUrl100")
        releaseDate = try map.value("releaseDate")
        genre = try map.value("primaryGenreName")
        
        guard let url = URL(string: imageUrl) else {
            throw SystemErrors.mappingError
        }
        albumImage = url
    }
}
