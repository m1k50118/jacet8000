//
//  HomeHomeInitializer.swift
//  JACET8000
//
//  Created by t2020060 on 27/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var homeViewController: HomeViewController!

    override func awakeFromNib() {

        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }

}
