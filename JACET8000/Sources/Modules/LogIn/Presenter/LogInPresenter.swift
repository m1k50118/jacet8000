//
//  LogInLogInPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

class LogInPresenter: LogInModuleInput, LogInViewOutput, LogInInteractorOutput {

    weak var view: LogInViewInput!
    var interactor: LogInInteractorInput!
    var router: LogInRouterInput!

    func viewIsReady() {

    }

    func presentSignupView() {
        router.presentSignupView()
    }
}
