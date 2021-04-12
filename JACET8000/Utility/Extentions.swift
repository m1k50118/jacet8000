//
//  Extentions.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/04/19.
//

import UIKit

extension String {
    enum ValidityType {
        case email
        //        case password
    }

    enum Regex: String {
        case email = "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
        case password
    }

    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""

        switch validityType {
        case .email:
            regex = Regex.email.rawValue
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

extension UIButton {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.touchStartAnimation()
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.touchEndAnimation()
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.touchEndAnimation()
    }

    private func touchStartAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }

    private func touchEndAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
}
