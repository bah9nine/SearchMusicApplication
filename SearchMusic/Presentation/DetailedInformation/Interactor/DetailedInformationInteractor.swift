//
//  DetailedInformationDetailedInformationInteractor.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

class DetailedInformationInteractor: DetailedInformationInteractorInput {
    weak var output: DetailedInformationInteractorOutput!
    var service: MusicService!
    
    func getFullInformation(albumId: CollectionID) {
        service.getMusic(by: albumId) { [weak self] (album, error) in
            guard let self = self else { return }
            
            if let albumInfo = album {
                self.output.show(albumInfo)
            }
            if let error = error {
                self.output.reject(with: error)
            }
        }
    }
}
