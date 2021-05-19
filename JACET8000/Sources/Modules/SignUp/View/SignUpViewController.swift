//
//  SignUpSignUpViewController.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SignUpViewController: UIViewController, SignUpViewInput {

    var output: SignUpViewOutput!

    var signUpView: SignUpView!

    let disposeBag = DisposeBag()

    override var shouldAutorotate: Bool {
        false
    }

    // MARK: Life cycle
    override func loadView() {
        super.loadView()
        self.signUpView = SignUpView(frame: UIScreen.main.bounds)
        self.signUpView.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        view.addSubview(signUpView)

        bind()
    }

    private func bind() {
        signUpView.emailTextField.rx.text.asDriver()
            .drive(onNext: { [weak self] text in
                self?.output.validate(text: text ?? "", validityType: .email)
            }).disposed(by: disposeBag)

        signUpView.passwordTextField.rx.text.asDriver()
            .drive(onNext: { [weak self] text in
                self?.output.validate(text: text ?? "", validityType: .password)
            }).disposed(by: disposeBag)

        output.validatedEmail.asObservable()
            .bind(onNext: { [weak self] result in
                switch result {
                case .valid:
                    self?.signUpView.invalidEmailLabel.rx.text
                        .onNext("")
                case .invalid(let failure):
                    self?.signUpView.invalidEmailLabel.rx.text
                        .onNext(failure.map({ return $0.message }).joined())
                }

            })
            .disposed(by: disposeBag)

        output.validatedPassword.asObservable()
            .bind(onNext: { [weak self] result in
                switch result {
                case .valid:
                    self?.signUpView.invalidPasswordLabel.rx.text
                        .onNext("")
                case .invalid(let failure):
                    self?.signUpView.invalidPasswordLabel.rx.text
                        .onNext(failure.map({ return $0.message }).joined())
                }
            })
            .disposed(by: disposeBag)

        Observable.combineLatest(output.validatedEmail, output.validatedPassword)
            .bind { [weak self] validatedEmail, validatedPassword in
                self?.signUpView.signUpButton.isEnabled = validatedEmail.isValid && validatedPassword.isValid
            }
            .disposed(by: disposeBag)

        signUpView.toLogInViewButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.output?.presentLogInView()
            }).disposed(by: disposeBag)
    }

    // MARK: SignUpViewInput
    func setupInitialState() {
    }
}

class SignUpView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localized.signUpTitleLabel()
        label.tintColor = .black
        label.textAlignment = .center
        label.sizeToFit()
        label.font = .systemFont(ofSize: 50)
        label.adjustsFontSizeToFitWidth = true

        return label
    }()

    var userNameTextField: UITextField! {
        didSet {
            userNameTextField.textContentType = .username
        }
    }

    var invalidUserNameLabel: UILabel!

    var userNameStackView: UIStackView!

    var emailTextField: UITextField! {
        didSet {
            emailTextField.textContentType = .emailAddress
        }
    }

    var invalidEmailLabel: UILabel!

    var emailStackView: UIStackView!

    var passwordTextField: UITextField! {
        didSet {
            passwordTextField.textContentType = .password
        }
    }

    var invalidPasswordLabel: UILabel!

    var passwordStackView: UIStackView!

    var userNameAndEmailAndPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()

    var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localized.signUpButtonLabel(), for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.isEnabled = false
        return button
    }()

    let toLogInViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localized.toLogInViewButtonLabel(), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = nil
        button.titleLabel?.font = .systemFont(ofSize: 14)
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
        clipsToBounds = true

        setupTitleLabel()
        setupUserNameAndEmailAndPasswordStackView()
        setupUserNameStackView()
        setupEmailStackView()
        setupPasswordStackView()
        setupUserNameTextField()
        setupInvalidUserNameLabel()
        setupEmailTextField()
        setupInvalidEmailLabel()
        setupPasswordTextField()
        setupInvalidPasswordLabel()
        setupSignUpButton()
        setupToLogInViewButton()
    }

    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
    }

    private func setupUserNameAndEmailAndPasswordStackView() {
        self.addSubview(userNameAndEmailAndPasswordStackView)
        userNameAndEmailAndPasswordStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
    }

    private func setupUserNameStackView() {
        userNameStackView = textFieldAndLabelStackView()
        userNameAndEmailAndPasswordStackView.addArrangedSubview(userNameStackView)
    }

    private func setupEmailStackView() {
        emailStackView = textFieldAndLabelStackView()
        userNameAndEmailAndPasswordStackView.addArrangedSubview(emailStackView)
    }

    private func setupPasswordStackView() {
        passwordStackView = textFieldAndLabelStackView()
        userNameAndEmailAndPasswordStackView.addArrangedSubview(passwordStackView)
    }

    private func setupUserNameTextField() {

        userNameTextField = textField(placeholder: R.string.localized.userName())
        addUnderLine(userNameTextField)
        userNameStackView.addArrangedSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }

    private func setupInvalidUserNameLabel() {
        invalidUserNameLabel = invalidMessageLabel(numberOfLines: 2)
        userNameStackView.addArrangedSubview(invalidUserNameLabel)
    }

    private func setupEmailTextField() {
        emailTextField = textField(placeholder: R.string.localized.email())
        addUnderLine(emailTextField)
        emailStackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }

    private func setupInvalidEmailLabel() {
        invalidEmailLabel = invalidMessageLabel(numberOfLines: 1)
        emailStackView.addArrangedSubview(invalidEmailLabel)
    }

    private func setupPasswordTextField() {
        passwordTextField = textField(placeholder: R.string.localized.password())
        addUnderLine(passwordTextField)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }

    private func setupInvalidPasswordLabel() {
        invalidPasswordLabel = invalidMessageLabel(numberOfLines: 5)
        passwordStackView.addArrangedSubview(invalidPasswordLabel)
    }

    private func setupSignUpButton() {
        self.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userNameAndEmailAndPasswordStackView.snp.bottom).offset(20)
            make.width.equalTo(userNameAndEmailAndPasswordStackView).dividedBy(2)
        }
    }

    private func setupToLogInViewButton() {
        self.addSubview(toLogInViewButton)
        toLogInViewButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }

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

    private func textFieldAndLabelStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }

    private func invalidMessageLabel(numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.textColor = .systemRed
        label.textAlignment = .left
        label.sizeToFit()
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = numberOfLines
        return label
    }
}
