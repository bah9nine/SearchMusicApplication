//
//  HistoryHistoryInitializer.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class HistoryModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var historyViewController: HistoryViewController!

    override func awakeFromNib() {

        let configurator = HistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: historyViewController)
    }

}
