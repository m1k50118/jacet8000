//
//  LearningLearningInitializer.swift
//  JACET8000
//
//  Created by t2020060 on 29/06/2021.
//  Copyright © 2021 n. All rights reserved.
//

import UIKit

class LearningModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var learningViewController: LearningViewController!

    override func awakeFromNib() {

        let configurator = LearningModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: learningViewController)
    }

}
