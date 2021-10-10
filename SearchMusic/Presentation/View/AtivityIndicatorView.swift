//
//  AtivityIndicatorView.swift
//  SearchMusic
//
//  Created by Иван Миронов on 09.10.2021.
//

import UIKit
import NVActivityIndicatorView

class ActivityIndicatorView {
    var view: UIView!
    var activityIndicatorView: NVActivityIndicatorView!
    var frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    init(view: UIView) {
        self.view = view
    }
    
    private func prepareToShowView() {
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .lineScale, color: .gray, padding: 30)
        view?.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func showActivityIndicator() {
        prepareToShowView()
        activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
    }
}

