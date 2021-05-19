//
//  EmailValidationPattern.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/18.
//

import Foundation

public struct EmailValidationPattern: ValidationPattern {
    public init() {

    }
    public var pattern: String {
        "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
    }

}
