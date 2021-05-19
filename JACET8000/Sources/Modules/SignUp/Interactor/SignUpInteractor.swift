//
//  SignUpSignUpInteractor.swift
//  JACET8000
//
//  Created by t2020060 on 29/04/2021.
//  Copyright © 2021 n. All rights reserved.
//

import Foundation

class SignUpInteractor: SignUpInteractorInput {

    weak var output: SignUpInteractorOutput!

    let minimumLength = 8

    func validate(text: String, validityType: ValidityType) {
        switch validityType {
        case .email:
            output.setValidatedEmail(result: emailValidate(inputValue: text))
        case .password:
            output.setValidatedPassword(result: passwordValidate(inputValue: text))
        }
    }

    func emailValidate(inputValue: String) -> ValidationResult {
        let emailPattern = EmailValidationPattern()
        let emailRule = ValidationRulePattern(pattern: emailPattern,
                                              error: SignUpValidationError(R.string.localized.invalidEmailMessage()))

        return Validator.validate(input: inputValue, rule: emailRule)
    }

    func passwordValidate(inputValue: String) -> ValidationResult {
        var validationRuleSet = ValidationRuleSet<String>()

        let minimumLengthRule = ValidationRuleLength(min: minimumLength,
                                                     error: SignUpValidationError(
                                                        R.string.localized.invalidMinimumLengthMessage(minimumLength.description)))
        let uppercasePattern = CaseValidationPattern.uppercase
        let uppercaseRule = ValidationRulePattern(pattern: uppercasePattern,
                                                  error: SignUpValidationError(R.string.localized.invalidUppercaseMessage()))

        let lowercasePattern = CaseValidationPattern.lowercase
        let lowercaseRule = ValidationRulePattern(pattern: lowercasePattern,
                                                  error: SignUpValidationError(R.string.localized.invalidLowercaseMessage()))

        let digitPattern = ContainsNumberValidationPattern()
        let digitRule = ValidationRulePattern(pattern: digitPattern,
                                              error: SignUpValidationError(R.string.localized.invalidDigitMessage()))

        let specialCharacterPattern = ContainsSpecialCharacter()
        let specialCharacterRule = ValidationRulePattern(pattern: specialCharacterPattern,
                                                         error: SignUpValidationError(R.string.localized.invalidSpecialCharacterMessage()))

        validationRuleSet.add(rule: minimumLengthRule)
        validationRuleSet.add(rule: uppercaseRule)
        validationRuleSet.add(rule: lowercaseRule)
        validationRuleSet.add(rule: digitRule)
        validationRuleSet.add(rule: specialCharacterRule)

        return Validator.validate(input: inputValue, rules: validationRuleSet)
    }
}
