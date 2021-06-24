//
//  LoginLoginViewOutput.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

protocol LogInViewOutput {
    /**
     @author t2020060
     Notify presenter that view is ready
     */

    func viewIsReady()
    func logIn(email: String, password: String)
}
