//
//  LogInLogInInteractor.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

import Firebase

class LogInInteractor: LogInInteractorInput {
    weak var output: LogInInteractorOutput!

    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            guard error == nil else {
                print("😀", error?.localizedDescription)
                return
            }
        }
        output.loginDidOccur()
    }
}
