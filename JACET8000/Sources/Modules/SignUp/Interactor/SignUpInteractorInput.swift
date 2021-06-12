//
//  SignUpSignUpInteractorInput.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import Foundation

protocol SignUpInteractorInput {
    func validate(text: String, validityType: ValidityType)
    func signUp(email: String, password: String, name: String)
}
