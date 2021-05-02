//
//  SignupSignupViewController.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, SignupViewInput {

    var output: SignupViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: SignupViewInput
    func setupInitialState() {
    }
}
