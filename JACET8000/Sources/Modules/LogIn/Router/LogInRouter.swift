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
        let viewController = SignUpViewController()

        config.configureModuleForViewInput(viewInput: viewController)

        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let window = sceneDelegate?.window
        guard window?.rootViewController != viewController else {
            return
        }

        window?.rootViewController = viewController
    }
}
