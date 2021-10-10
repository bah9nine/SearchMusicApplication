//
//  AlbumCell.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import UIKit
import Kingfisher

class AlbumCell: UICollectionViewCell {
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var uiImageView: UIImageView!

    func fillCell(with data: Album) {
        artistName.text = data.artistName
        albumName.text = data.albumName
        uiImageView.kf.setImage(with: data.albumImage)
        uiImageView.contentMode = .scaleAspectFill
    }
    
    static func nib() -> UINib {
        return UINib(nibName: AlbumCell.identifer, bundle: nil)
    }
}
