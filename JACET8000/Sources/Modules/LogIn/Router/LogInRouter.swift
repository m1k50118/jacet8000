//
//  LogInLogInRouter.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//
import UIKit

class LogInRouter: LogInRouterInput {
    private unowned let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func presentHomeView() {
        let homeViewController = HomeViewController()
        let config = HomeModuleConfigurator()
        config.configureModuleForViewInput(viewInput: homeViewController)
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            guard let window = sceneDelegate.window else { return }
            window.rootViewController = homeViewController
            window.makeKeyAndVisible()
        }
    }
}
