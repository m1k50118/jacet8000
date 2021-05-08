//
//  LogInLogInInitializer.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LogInModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var logInViewController: LogInViewController!

    override func awakeFromNib() {

        let configurator = LogInModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: logInViewController)
    }

}
