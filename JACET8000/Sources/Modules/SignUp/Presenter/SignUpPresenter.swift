//
//  SignUpSignUpPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

class SignUpPresenter: SignUpModuleInput, SignUpViewOutput, SignUpInteractorOutput {

    weak var view: SignUpViewInput!
    var interactor: SignUpInteractorInput!
    var router: SignUpRouterInput!

    func viewIsReady() {

    }
}
