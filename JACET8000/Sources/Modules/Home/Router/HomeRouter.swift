//
//  HomeHomeRouter.swift
//  JACET8000
//
//  Created by t2020060 on 27/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterInput {
    private unowned let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func presentLearningView(level: String) {
        let vc = LearningViewController(level: level)
        let config = LearningModuleConfigurator()
        config.configureModuleForViewInput(viewInput: vc)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
