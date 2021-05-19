//
//  CaseValidationPattern.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/18.
//

import Foundation

public enum CaseValidationPattern: String, ValidationPattern {
    case uppercase,
         lowercase

    public var pattern: String {
        switch self {
        case .uppercase:
            return "^.*?[A-Z].*?$"
        case .lowercase:
            return "^.*?[a-z].*?$"
        }
    }
}
