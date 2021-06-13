//
//  LandingLandingViewController.swift
//  JACET8000
//
//  Created by t2020060 on 13/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class LandingViewController: UIViewController, LandingViewInput {

    var output: LandingViewOutput!

    var landingView: LandingView!

    let disposeBag = DisposeBag()

    override func loadView() {
        super.loadView()
        landingView = LandingView(frame: UIScreen.main.bounds)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        self.view.addSubview(landingView)

        bind()
    }

    // MARK: LandingViewInput
    func setupInitialState() {
    }

    func bind() {
        landingView.loginButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                self.output.presentLogInView()
            }).disposed(by: disposeBag)

        landingView.signUpButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                self.output.presentSignUpView()
            }).disposed(by: disposeBag)
    }
}

class LandingView: UIView {

    var title: UILabel = {
        let label = UILabel()
        label.text = L10n.landingTitle
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.tintColor = .systemGray
        return label
    }()

    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.logInButtonLabel, for: .normal)
        button.backgroundColor = ColorName.logInButtonBackground.color
        button.layer.cornerRadius = 21
        return button
    }()

    var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.signUpButtonLabel, for: .normal)
        button.backgroundColor = ColorName.signUpButtonBackground.color
        button.layer.cornerRadius = 21
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        setUpLandingViewTitle()
        setUpLogInButton()
        setUpSignUpButton()
    }

    private func setUpLandingViewTitle() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(225)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
    }

    private func setUpLogInButton() {
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(32)
            make.width.equalTo(title.snp.width)
            make.height.equalTo(42)
        }
    }

    private func setUpSignUpButton() {
        addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.width.equalTo(loginButton.snp.width)
            make.height.equalTo(42)
        }
    }
}
