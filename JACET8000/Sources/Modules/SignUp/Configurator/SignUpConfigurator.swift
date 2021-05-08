//
//  SignUpSignUpConfigurator.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class SignUpModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SignUpViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SignUpViewController) {

        let router = SignUpRouter()

        let presenter = SignUpPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SignUpInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
