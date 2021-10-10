//
//  CollectionDIsplayManager.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import UIKit

class CollectionDisplayManagerImp: NSObject, CollectionDisplayManager {
    private var collectionView: UICollectionView!
    weak var delegate: CollectionDisplayManagerDelegate?
    private let padding = 20 // padding between cells
    private var albums: [Album] = []
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(AlbumCell.nib(), forCellWithReuseIdentifier: AlbumCell.identifer)
    }
    
    private func getSizeOfOneCell() -> CGSize {
        let numberOfItemsInRow = 2
        let screenWidth = Int(collectionView.frame.width)
        let cellWidth = (screenWidth - (padding * (numberOfItemsInRow + 1))) / numberOfItemsInRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func reloadData(with albums: [Album]) {
        self.albums = albums
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
}

extension CollectionDisplayManagerImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let albumID = albums[indexPath.row].albumId
        delegate?.collectioDisplayManager(self, didSelected: albumID)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.endEdidting(self)
    }
}

extension CollectionDisplayManagerImp: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifer, for: indexPath) as! AlbumCell
        cell.fillCell(with: albums[indexPath.row])
        return cell
    }
}

extension CollectionDisplayManagerImp: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getSizeOfOneCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cgFloatPaddint = CGFloat(padding)
        return UIEdgeInsets(top: 0, left: cgFloatPaddint, bottom: 0, right: cgFloatPaddint)
    }
}
