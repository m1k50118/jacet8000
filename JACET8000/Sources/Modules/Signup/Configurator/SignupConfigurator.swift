//
//  SignupSignupConfigurator.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class SignupModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SignupViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SignupViewController) {

        let router = SignupRouter()

        let presenter = SignupPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SignupInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
