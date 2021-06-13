//
//  LandingLandingRouter.swift
//  JACET8000
//
//  Created by t2020060 on 13/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LandingRouter: LandingRouterInput {

    private unowned let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func presentLogInView() {
        let vc = LogInViewController()
        let config = LogInModuleConfigurator()
        config.configureModuleForViewInput(viewInput: vc)

        viewController.navigationController?.pushViewController(vc, animated: true)
    }

    func presentSignUpView() {
        let vc = SignUpViewController()
        let config = SignUpModuleConfigurator()
        config.configureModuleForViewInput(viewInput: vc)

        viewController.navigationController?.pushViewController(vc, animated: true)
    }

}
