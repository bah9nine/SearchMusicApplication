//
//  TableViewDisplayManager.swift
//  SearchMusic
//
//  Created by Иван Миронов on 09.10.2021.
//

import UIKit

class HistoryTableViewDisplayManager: NSObject {
    private let tableView: UITableView!
    weak var delegate: HistoryTableViewDisplayManagerDelegate?
    private var historyArray: [History] = []
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryCell.nib(), forCellReuseIdentifier: HistoryCell.identifer)
    }
    
    func reloadTableView(histories: [History]) {
        historyArray = histories
        tableView.reloadData()
    }
    
    func clearHistory() {
        historyArray = []
        tableView.reloadData()
    }
}

extension HistoryTableViewDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let history = historyArray[indexPath.row].requestHistory else { return }
        delegate?.tableViewDisplayManager(self, didSelected: history)
    }
}

extension HistoryTableViewDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifer) as! HistoryCell
        cell.fillCell(history: historyArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
