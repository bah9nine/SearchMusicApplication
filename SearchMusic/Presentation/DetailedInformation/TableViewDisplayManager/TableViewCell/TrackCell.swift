//
//  TrackCell.swift
//  SearchMusic
//
//  Created by Иван Миронов on 08.10.2021.
//

import UIKit

class TrackCell: UITableViewCell {
    @IBOutlet weak var trackNumberLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 7, left: 7, bottom: 0, right: 0))
    }
    
    func fillCell(with track: Track, numberOf row: Int) {
        trackNameLabel.text = track.trackName
        trackNumberLabel.text = row.description
        artistNameLabel.text = track.artistName
    }
    
    static func nib() -> UINib {
        return UINib(nibName: TrackCell.identifer, bundle: nil)
    }
}
