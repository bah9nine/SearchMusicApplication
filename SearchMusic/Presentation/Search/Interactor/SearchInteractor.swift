//
//  SearchSearchInteractor.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

class SearchInteractor: SearchInteractorInput {
    weak var output: SearchInteractorOutput!
    var musicService: MusicService!
    var historyService: HistoryService!
    
    func getAlbums(by text: String) {
        musicService.getAlbums(for: text) {[weak self] (albums, error) in
            guard let self = self else { return }
            
            if let albumsArray = albums {
                self.output.getData(albums: albumsArray)
            } else if let error = error {
                self.output.reject(with: error)
            }
        }
    }
    
    func saveRequest(text: String) {
        do {
            try historyService.saveSearch(request: text)
        } catch {
            output.reject(with: error)
        }
    }
}
