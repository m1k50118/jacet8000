//
//  LogInLogInViewController.swift
//  JACET8000
//
//  Created by t2020060 on 20/03/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit
import Firebase
import SnapKit
import RxSwift
import RxCocoa

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

        self.logInView = LogInView(frame: self.view.frame)
        self.logInView.backgroundColor = .systemBackground
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
    func setupInitialState() {
    }

    private func bind() {
        logInView.emailTextField.rx.text.orEmpty.asDriver()
            .drive(onNext: { [unowned self] x in
                logInView.logInButton.isEnabled = !x.isValid(.email)
            }).disposed(by: disposeBag)
        logInView.toSignupViewButton.rx.tap
            .subscribe {[weak self] _ in
                self?.output.presentSignupView()
            }.disposed(by: disposeBag)
    }
}

class LogInView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localized.logInTitleLabel()
        label.tintColor = .black
        label.textAlignment = .center
        label.sizeToFit()
        label.font = .systemFont(ofSize: 50)
        label.adjustsFontSizeToFitWidth = true

        return label
    }()

    let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10

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
        button.setTitle(R.string.localized.logInButtonLabel(), for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        return button
    }()

    let toSignupViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localized.toSignUpViewButtonLabel(), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = nil
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemBackground
        clipsToBounds = true

        setupTitleLabel()
        setupTextFieldStackView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLogInButton()
        setupToSignupViewButton()
    }

    // MARK: setup constraints
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
    }

    private func setupTextFieldStackView() {
        self.addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
    }

    private func setupEmailTextField() {
        emailTextField = textField(placeholder: R.string.localized.email())
        addUnderLine(emailTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
    }

    private func setupPasswordTextField() {
        passwordTextField = textField(placeholder: R.string.localized.password())
        addUnderLine(passwordTextField)
        passwordTextField.isSecureTextEntry = true
        textFieldStackView.addArrangedSubview(passwordTextField)
    }

    private func setupLogInButton() {
        self.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            make.width.equalToSuperview().dividedBy(1.5)
        }
    }

    private func setupToSignupViewButton() {
        self.addSubview(toSignupViewButton)
        toSignupViewButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
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
