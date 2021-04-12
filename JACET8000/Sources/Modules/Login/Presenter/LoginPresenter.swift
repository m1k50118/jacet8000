//
//  LoginLoginPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!

    func viewIsReady() {

    }

    func presentSignupView() {
        router.presentSignupView()
    }
}
