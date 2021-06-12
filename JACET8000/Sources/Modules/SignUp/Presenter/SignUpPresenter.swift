//
//  SignUpSignUpPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import RxCocoa
import RxSwift

class SignUpPresenter: SignUpModuleInput {
    weak var view: SignUpViewInput!
    var interactor: SignUpInteractorInput!
    var router: SignUpRouterInput!

    let validatedEmail = PublishRelay<ValidationResult>()
    let validatedPassword = PublishRelay<ValidationResult>()
}

extension SignUpPresenter: SignUpViewOutput {
    func viewIsReady() {}

    func validate(text: String, validityType: ValidityType) {
        interactor.validate(text: text, validityType: validityType)
    }

    func presentLogInView() {
        router.presentLogInView()
    }

    func signUp(email: String, password: String, name: String) {
        interactor.signUp(email: email, password: password, name: name)
    }
}

extension SignUpPresenter: SignUpInteractorOutput {
    func setValidatedEmail(result: ValidationResult) {
        validatedEmail.accept(result)
    }

    func setValidatedPassword(result: ValidationResult) {
        validatedPassword.accept(result)
    }

    func completedSignUp() {
        view.presentCompletedSignUp()
    }

    func presentSignUpError(_ error: String) {
        view.showAlertSignUpError(error)
    }
}
