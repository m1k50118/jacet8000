//
//  LandingLandingInitializer.swift
//  JACET8000
//
//  Created by t2020060 on 13/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LandingModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var landingViewController: LandingViewController!

    override func awakeFromNib() {

        let configurator = LandingModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: landingViewController)
    }

}