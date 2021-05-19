//
//  ValidationRulePattern.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/19.
//

import Foundation

public struct ValidationRulePattern: ValidationRule {

    public let pattern: String
    public var error: ValidationError

    public init(pattern: String, error: ValidationError) {
        self.pattern = pattern
        self.error = error
    }

    public init(pattern: ValidationPattern, error: ValidationError) {
        self.init(pattern: pattern.pattern, error: error)
    }

    public func validate(input: String?) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: input)
    }
}
