//
//  HistoryHistoryViewController.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewInput {

    @IBOutlet weak var tableView: UITableView!
    var output: HistoryViewOutput!
    @IBOutlet weak var clearHistoryButton: UIButton!
    private var displayManager: HistoryTableViewDisplayManager?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    //update history in tableView every time when vc will apperar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.getHistoryArray()
    }

    // MARK: HistoryViewInput
    func setupInitialState() {
        displayManager = HistoryTableViewDisplayManager(tableView: tableView)
        displayManager?.delegate = self
        clearHistoryButton.layer.cornerRadius = 7
    }
    
    func reloadTableView(with histories: [History]) {
        displayManager?.reloadTableView(histories: histories)
    }
    
    //clear history tableView
    @IBAction func buttonDIdPressed(_ sender: UIButton) {
        output.clearHistory()
        displayManager?.clearHistory()
    }
}

extension HistoryViewController: HistoryTableViewDisplayManagerDelegate {
    //when a cell was pressed, we take the first vc from the tabbarStack, and call the method that will make a request for history data
    func tableViewDisplayManager(_ tableViewDisplayManager: HistoryTableViewDisplayManager, didSelected historyRequest: String) {
        if let vc = self.tabBarController?.viewControllers?.first as? SearchViewController {
            vc.openHistory(search: historyRequest)
            self.tabBarController?.selectedIndex = 0
        }
    }
}
