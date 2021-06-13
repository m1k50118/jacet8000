//
//  LandingLandingConfigurator.swift
//  JACET8000
//
//  Created by t2020060 on 13/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LandingModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LandingViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LandingViewController) {

        let router = LandingRouter(viewController: viewController)

        let presenter = LandingPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LandingInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
