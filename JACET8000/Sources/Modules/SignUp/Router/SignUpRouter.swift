//
//  SignUpSignUpRouter.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class SignUpRouter: SignUpRouterInput {
    func presentLogInView() {
        let config = LogInModuleConfigurator()
        let logInViewController = LogInViewController()

        config.configureModuleForViewInput(viewInput: logInViewController)
        Navigator.shared.presentViewController(viewController: logInViewController)
    }
}
