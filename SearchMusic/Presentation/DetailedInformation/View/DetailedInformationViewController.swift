//
//  DetailedInformationDetailedInformationViewController.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit
import Kingfisher

class DetailedInformationViewController: UIViewController, DetailedInformationViewInput {
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var uiImageView: UIImageView!
    var output: DetailedInformationViewOutput!
    private var displayManager: TableViewDisplayManager?
    private var activityIndicator: ActivityIndicatorView?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: DetailedInformationViewInput
    func setupInitialState() {
        displayManager = TableViewDisplayManagerImp(tableView: tableView)
        activityIndicator = ActivityIndicatorView(view: self.view)
    }
    
    //setup UIelements and reload tableview
    func updateData(with albumInfo: AlbumInfo) {
        artistNameLabel.text = albumInfo.artistName
        collectionNameLabel.text = albumInfo.collectionName
        genreLabel.text = albumInfo.genre
        uiImageView.kf.setImage(with: albumInfo.albumImage)
        releaseDateLabel.text = convertDate(date: albumInfo.releaseDate)
        
        if let tracks = albumInfo.tracks {
            displayManager?.reloadData(with: tracks)
        }
    }
    
    func showActivityIndicatorView() {
        activityIndicator?.showActivityIndicator()
        toggleInterfaceVisibility()
    }
    
    func hideActivityIndicatorView() {
        activityIndicator?.hideActivityIndicator()
        toggleInterfaceVisibility()
    }
    
    //when error, close vc by this method
    func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    private func toggleInterfaceVisibility() {
        artistNameLabel.isHidden = artistNameLabel.isHidden ? false : true
        tableView.isHidden = tableView.isHidden ? false : true
        releaseDateLabel.isHidden = releaseDateLabel.isHidden ? false : true
        genreLabel.isHidden = genreLabel.isHidden ? false : true
        collectionNameLabel.isHidden = collectionNameLabel.isHidden ? false : true
        uiImageView.isHidden = uiImageView.isHidden ? false : true
    }
    
    private func convertDate(date: String) -> String {
        guard let index = date.firstIndex(of: "-") else {
            return ""
        }
        let subString = date[..<index]
        let yearStr = String(subString)
        
        return yearStr
    }
}
