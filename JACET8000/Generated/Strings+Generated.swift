// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Close
  internal static let close = L10n.tr("Localized", "close")
  /// Email
  internal static let email = L10n.tr("Localized", "email")
  /// forgot password
  internal static let forgotPassword = L10n.tr("Localized", "forgotPassword")
  /// At least more than 1 number\n
  internal static let invalidDigitMessage = L10n.tr("Localized", "invalidDigitMessage")
  /// Invalid email format
  internal static let invalidEmailMessage = L10n.tr("Localized", "invalidEmailMessage")
  /// At least more than 1 lowercase\n
  internal static let invalidLowercaseMessage = L10n.tr("Localized", "invalidLowercaseMessage")
  /// At least more than %@ characters\n
  internal static func invalidMinimumLengthMessage(_ p1: Any) -> String {
    return L10n.tr("Localized", "invalidMinimumLengthMessage", String(describing: p1))
  }
  /// At least more than 1 special character\n
  internal static let invalidSpecialCharacterMessage = L10n.tr("Localized", "invalidSpecialCharacterMessage")
  /// At least more than 1 uppercase\n
  internal static let invalidUppercaseMessage = L10n.tr("Localized", "invalidUppercaseMessage")
  /// English\nfor\nJapanese People
  internal static let landingTitle = L10n.tr("Localized", "LandingTitle")
  /// LogIn
  internal static let logInButtonLabel = L10n.tr("Localized", "logInButtonLabel")
  /// Log In
  internal static let logInTitleLabel = L10n.tr("Localized", "logInTitleLabel")
  /// Password
  internal static let password = L10n.tr("Localized", "password")
  /// SignUp
  internal static let signUpButtonLabel = L10n.tr("Localized", "signUpButtonLabel")
  /// Can't create your account
  internal static let signUpErrorAlertTitle = L10n.tr("Localized", "signUpErrorAlertTitle")
  /// Sign Up
  internal static let signUpTitleLabel = L10n.tr("Localized", "signUpTitleLabel")
  /// Already you have an account?
  internal static let toLogInViewButtonLabel = L10n.tr("Localized", "toLogInViewButtonLabel")
  /// Don't you have an account yet?
  internal static let toSignUpViewButtonLabel = L10n.tr("Localized", "toSignUpViewButtonLabel")
  /// UserName
  internal static let userName = L10n.tr("Localized", "userName")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
