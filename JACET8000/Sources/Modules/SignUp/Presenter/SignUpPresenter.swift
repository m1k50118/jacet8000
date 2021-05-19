//
//  SignUpSignUpPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import RxCocoa
import RxSwift

class SignUpPresenter: SignUpModuleInput, SignUpViewOutput, SignUpInteractorOutput {

    weak var view: SignUpViewInput!
    var interactor: SignUpInteractorInput!
    var router: SignUpRouterInput!

    let validatedEmail = PublishRelay<ValidationResult>()
    let validatedPassword = PublishRelay<ValidationResult>()

    func viewIsReady() {

    }
    func validate(text: String, validityType: ValidityType) {
        interactor.validate(text: text, validityType: validityType)
    }

    func presentLogInView() {
        router.presentLogInView()
    }

    func setValidatedEmail(result: ValidationResult) {
        validatedEmail.accept(result)
    }

    func setValidatedPassword(result: ValidationResult) {
        validatedPassword.accept(result)
    }
}
