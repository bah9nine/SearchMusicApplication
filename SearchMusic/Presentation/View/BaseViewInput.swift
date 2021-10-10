//
//  BaseViewInput.swift
//  SearchMusic
//
//  Created by Иван Миронов on 10.10.2021.
//

import UIKit

protocol BaseViewInput {
    func showAlert(title: String?, massage: String?, action: (() -> ())?)
}

extension BaseViewInput {
    func showAlert(title: String?, massage: String?, action: (() -> ())?) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: title, style: .default) { _ in
            if let execute = action {
                execute()
            }
        }
        
        alert.addAction(alertAction)
        vc.present(alert, animated: true, completion: nil)
    }
}

