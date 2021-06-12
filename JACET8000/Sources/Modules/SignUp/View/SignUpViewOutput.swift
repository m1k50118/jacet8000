//
//  SignUpSignUpViewOutput.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import RxCocoa
import UIKit

protocol SignUpViewOutput {
    /**
     @author t2020060
     Notify presenter that view is ready
     */

    var validatedEmail: PublishRelay<ValidationResult> { get }
    var validatedPassword: PublishRelay<ValidationResult> { get }
    func viewIsReady()
    func presentLogInView()
    func validate(text: String, validityType: ValidityType)
    func signUp(email: String, password: String, name: String)
}
