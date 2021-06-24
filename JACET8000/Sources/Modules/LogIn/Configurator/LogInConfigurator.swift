//
//  LogInLogInConfigurator.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LogInModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? LogInViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LogInViewController) {
        let router = LogInRouter(viewController: viewController)

        let presenter = LogInPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LogInInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
