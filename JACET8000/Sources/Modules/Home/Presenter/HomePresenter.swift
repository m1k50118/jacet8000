//
//  HomeHomePresenter.swift
//  JACET8000
//
//  Created by t2020060 on 27/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

class HomePresenter: HomeModuleInput {
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {}
}

extension HomePresenter: HomeViewOutput {
    func presentLearningView(level: String) {
        router.presentLearningView(level: level)
    }
}

extension HomePresenter: HomeInteractorOutput {}
