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
        let alert = UIAlertController(title: "Success log in", message: "ログイン成功", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(defaultAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
