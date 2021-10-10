//
//  SearchSearchInitializer.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class SearchModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var searchViewController: SearchViewController!

    override func awakeFromNib() {

        let configurator = SearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: searchViewController)
    }

}
