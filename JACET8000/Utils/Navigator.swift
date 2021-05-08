//
//  Navigator.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/08.
//

import UIKit

open class Navigator {
    static let shared = Navigator()

    open func presentViewController(viewController: UIViewController) {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            return
        }
        let window = sceneDelegate.window
        guard window?.rootViewController != viewController else {
            return
        }

        window?.rootViewController = viewController
    }
}
