//
//  HistoryCell.swift
//  SearchMusic
//
//  Created by Иван Миронов on 09.10.2021.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var historyLabel: UILabel!
    
    func fillCell(history: History) {
        historyLabel.text = history.requestHistory
    }
    
    static func nib() -> UINib {
        return UINib(nibName: HistoryCell.identifer, bundle: nil)
    }
}
