//
//  LandingLandingPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 13/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

class LandingPresenter: LandingModuleInput {

    weak var view: LandingViewInput!
    var interactor: LandingInteractorInput!
    var router: LandingRouterInput!
}

extension LandingPresenter: LandingViewOutput {
    func viewIsReady() {

    }

    func presentLogInView() {
        router.presentLogInView()
    }

    func presentSignUpView() {
        router.presentSignUpView()
    }
}

extension LandingPresenter: LandingInteractorOutput {

}
