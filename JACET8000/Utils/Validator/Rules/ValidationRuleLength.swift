//
//  ValidationRuleLength.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/19.
//

import Foundation

public struct ValidationRuleLength: ValidationRule {

    public let min: Int
    public let max: Int
    public var error: ValidationError

    public init(min: Int = 0,
                max: Int = Int.max,
                error: ValidationError) {
        self.min = min
        self.max = max
        self.error = error
    }

    public func validate(input: String?) -> Bool {
        guard let input = input else {
            return false
        }

        let length = input.count

        return length >= min && length <= max

    }
}
