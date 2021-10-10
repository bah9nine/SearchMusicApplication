//
//  DisplayManager.swift
//  SearchMusic
//
//  Created by Иван Миронов on 08.10.2021.
//

import UIKit

class TableViewDisplayManagerImp: NSObject, TableViewDisplayManager {
    private let tableView: UITableView!
    private var tracksArray: [Track] = []
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(TrackCell.nib(), forCellReuseIdentifier: TrackCell.identifer)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func reloadData(with tracks: [Track]) {
        tracksArray = tracks
        tableView.reloadData()
    }
}

extension TableViewDisplayManagerImp: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracksArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension TableViewDisplayManagerImp: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.identifer) as! TrackCell
        cell.fillCell(with: tracksArray[indexPath.row], numberOf: indexPath.row + 1)
        cell.selectionStyle = . none
        return cell
    }
}
