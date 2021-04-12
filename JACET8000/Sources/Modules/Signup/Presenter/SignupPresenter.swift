//
//  SignupSignupPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

class SignupPresenter: SignupModuleInput, SignupViewOutput, SignupInteractorOutput {

    weak var view: SignupViewInput!
    var interactor: SignupInteractorInput!
    var router: SignupRouterInput!

    func viewIsReady() {

    }
}
