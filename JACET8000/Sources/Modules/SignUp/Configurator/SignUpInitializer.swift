//
//  SignUpSignUpInitializer.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class SignUpModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var signUpViewController: SignUpViewController!

    override func awakeFromNib() {

        let configurator = SignUpModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: signUpViewController)
    }

}
