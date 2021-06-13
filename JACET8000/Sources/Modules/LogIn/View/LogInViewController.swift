//
//  LogInLogInViewController.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

import Firebase
import RxCocoa
import RxSwift
import SnapKit
import UIKit

class LogInViewController: UIViewController, LogInViewInput {
    var output: LogInViewOutput!

    var logInView: LogInView!

    var handle: AuthStateDidChangeListenerHandle?

    let disposeBag = DisposeBag()

    override var shouldAutorotate: Bool {
        false
    }

    // MARK: Life cycle

    override func loadView() {
        super.loadView()
        logInView = LogInView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        view.addSubview(logInView)

        bind()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Auth.auth().addStateDidChangeListener { _, _ in
            // ...
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        Auth.auth().removeStateDidChangeListener(handle!)
    }

    // MARK: LogInViewInput

    func setupInitialState() {}

    private func bind() {
//        logInView.emailTextField.rx.text.orEmpty.asDriver()
//            .drive(onNext: { [unowned self] x in
//                logInView.logInButton.isEnabled = !x.isValid(.email)
//            }).disposed(by: disposeBag)
    }
}

class LogInView: UIView {
    let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 20

        return stackView
    }()

    var emailTextField: UITextField! {
        didSet {
            emailTextField.textContentType = .emailAddress
        }
    }

    var passwordTextField: UITextField! {
        didSet {
            passwordTextField.textContentType = .password
        }
    }

    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.logInButtonLabel, for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemBackground
        clipsToBounds = true

        setupTextFieldStackView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLogInButton()
    }

    // MARK: setup constraints

    private func setupTextFieldStackView() {
        addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
    }

    private func setupEmailTextField() {
        emailTextField = textField(placeholder: L10n.email)
        addUnderLine(emailTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
    }

    private func setupPasswordTextField() {
        passwordTextField = textField(placeholder: L10n.password)
        addUnderLine(passwordTextField)
        passwordTextField.isSecureTextEntry = true
        textFieldStackView.addArrangedSubview(passwordTextField)
    }

    private func setupLogInButton() {
        addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            make.width.equalTo(textFieldStackView).dividedBy(2)
        }
    }

    // MARK: extra

    private func textField(placeholder: String) -> UITextField {
        let textField = UITextField()

        textField.backgroundColor = .white
        textField.placeholder = placeholder
        textField.borderStyle = .none

        return textField
    }

    private func addUnderLine(_ textField: UITextField) {
        let view = UIView()
        view.backgroundColor = .gray
        textField.addSubview(view)
        textField.bringSubviewToFront(view)
        view.snp.makeConstraints { make in
            make.leading.bottom.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
