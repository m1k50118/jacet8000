//
//  LogInLogInRouter.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//
import UIKit

class LogInRouter: LogInRouterInput {

    func presentSignupView() {
        let config = SignUpModuleConfigurator()
        let signUpViewController = SignUpViewController()

        config.configureModuleForViewInput(viewInput: signUpViewController)

        Navigator.shared.presentViewController(viewController: signUpViewController)
    }
}
