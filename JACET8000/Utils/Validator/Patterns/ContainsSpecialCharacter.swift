//
//  ContainsSpecialCharacter.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/19.
//

import Foundation

public struct ContainsSpecialCharacter: ValidationPattern {
    public init() {

    }

    public var pattern: String {
        "^.*?[#?!@$%^&*-].*?$"
    }
}
