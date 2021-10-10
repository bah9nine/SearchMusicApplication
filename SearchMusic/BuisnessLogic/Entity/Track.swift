//
//  Track.swift
//  SearchMusic
//
//  Created by Иван Миронов on 08.10.2021.
//

import Foundation
import ObjectMapper

struct Track: ImmutableMappable {
    let trackName: String
    let artistName: String
    
    init(map: Map) throws {
        trackName = try map.value("trackName")
        artistName = try map.value("artistName")
    }
}
