//
//  AlbumsServiceImp.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import Foundation
import Alamofire
import ObjectMapper

class MusicServiceImp: MusicService {
    static let shared = MusicServiceImp()
    private let baseUrl = "https://itunes.apple.com/"
    private init() {}
    
    func getAlbums(for artist: String, completionHandler: @escaping ([Album]?, Error?) -> ()) {
        let url = baseUrl + ("search")
        let encodeText = artist.replacingOccurrences(of: " ", with: "+")
        let parametrs: Parameters = ["term": encodeText, "entity": "album"]
        
        AF.request(url, parameters: parametrs).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let json = data as? [String: Any],
                      let results = json["results"] as? [[String: Any]],
                      !results.isEmpty else {
                    completionHandler(nil, SystemErrors.incorrectRequest)
                    return
                }
                
                do {
                    let albumsArray = try Mapper<Album>().mapArray(JSONObject: results)
                    let sortedAlbums = self.sortedByAlphabet(albums: albumsArray)
                    completionHandler(sortedAlbums, nil)
                } catch {
                    completionHandler(nil ,SystemErrors.mappingError)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func getMusic(by albumId: CollectionID, completionHandler: @escaping (AlbumInfo?, Error?) -> ()) {
        let url = baseUrl + "lookup"
        let parametrs: Parameters = ["id": albumId, "entity": "song"]
        
        AF.request(url, parameters: parametrs).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let json = data as? [String: Any],
                      let results = json["results"] as? [[String: Any]],
                      !results.isEmpty  else {
                    completionHandler(nil, SystemErrors.mappingError)
                    return
                }
                do {
                    var trackArray: [Track] = []
                    let jsonTracks = results[1..<results.count]
                    try jsonTracks.forEach { jsonTrack in
                        trackArray.append(try Mapper<Track>().map(JSON: jsonTrack))
                    }
                    
                    var AlbumInfo = try Mapper<AlbumInfo>().map(JSONObject: results[0])
                    AlbumInfo.tracks = trackArray
                    
                    completionHandler(AlbumInfo, nil)
                } catch {
                    completionHandler(nil, error)
                }
      
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    private func sortedByAlphabet(albums: [Album]) -> [Album] {
        albums.sorted {
            return $0.albumName < $1.albumName
        }
    }
}
