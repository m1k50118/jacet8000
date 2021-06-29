//
//  LearningLearningConfigurator.swift
//  JACET8000
//
//  Created by t2020060 on 29/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LearningModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LearningViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LearningViewController) {

        let router = LearningRouter()

        let presenter = LearningPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LearningInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
