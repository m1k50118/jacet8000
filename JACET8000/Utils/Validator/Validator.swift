//
//  Validator.swift
//  JACET8000
//
//  Created by 佐藤真 on 2021/05/09.
//

import Foundation

public enum ValidityType {
    case email
    case password
}

public struct Validator {
    public static func validate<Rule: ValidationRule>(input: Rule.InputType?, rule: Rule) -> ValidationResult {

        var ruleSet = ValidationRuleSet<Rule.InputType>()
        ruleSet.add(rule: rule)
        return Validator.validate(input: input, rules: ruleSet)
    }

    public static func validate<Input>(input: Input?, rules: ValidationRuleSet<Input>) -> ValidationResult {

        let errors = rules.rules
            .filter { !$0.validate(input: input) }
            .map { $0.error }

        return errors.isEmpty ? .valid : .invalid(errors)
    }
}
