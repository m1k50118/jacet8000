//
//  SignUpSignUpInteractorOutput.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import Foundation

protocol SignUpInteractorOutput: AnyObject {
    func setValidatedEmail(result: ValidationResult)
    func setValidatedPassword(result: ValidationResult)
    func completedSignUp()
    func presentSignUpError(_ error: String)
}
