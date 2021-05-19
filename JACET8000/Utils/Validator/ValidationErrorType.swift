//
//  ValidationErrorType.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/09.
//

import Foundation

struct SignUpValidationError: ValidationError {
    let message: String

    public init(_ message: String) {
        self.message = message
    }
}
