//
//  LearningLearningPresenter.swift
//  JACET8000
//
//  Created by t2020060 on 29/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

class LearningPresenter: LearningModuleInput, LearningViewOutput, LearningInteractorOutput {

    weak var view: LearningViewInput!
    var interactor: LearningInteractorInput!
    var router: LearningRouterInput!

    func viewIsReady() {

    }
}
