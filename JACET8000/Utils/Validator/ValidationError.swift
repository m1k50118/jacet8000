//
//  ValidationError.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/09.
//

import Foundation

public protocol ValidationError: Error {

    var message: String { get }
}
