//
//  DetailedInformationDetailedInformationInitializer.swift
//  SearchMusic
//
//  Created by Ivan on 06/10/2021.
//  Copyright © 2021 mironovCo. All rights reserved.
//

import UIKit

class DetailedInformationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailedinformationViewController: DetailedInformationViewController!

    override func awakeFromNib() {

        let configurator = DetailedInformationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailedinformationViewController)
    }

}
