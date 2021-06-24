//
//  LogInLogInPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

class LogInPresenter: LogInModuleInput {
    weak var view: LogInViewInput!
    var interactor: LogInInteractorInput!
    var router: LogInRouterInput!
}

extension LogInPresenter: LogInViewOutput {
    func viewIsReady() {}

    func logIn(email: String, password: String) {
        interactor.logIn(email: email, password: password)
    }
}

extension LogInPresenter: LogInInteractorOutput {
    func loginDidOccur() {
        router.presentHomeView()
    }
}
