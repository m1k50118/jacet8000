//
//  ContainsNumberValidationPattern.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/18.
//

import Foundation

public struct ContainsNumberValidationPattern: ValidationPattern {
    public init() {

    }

    public var pattern: String {
        ".*\\d.*"
    }
}
