//
//  OnboardingTheme.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 23.05.2025.
//

import SwiftUI

//MARK: Enum for customization on onboarding flow
///Provides themes cases for customization process on the View
public enum OnboardingTheme{
    //MARK: Properties
    ///Color themes for the View
    case `default`
    case custom(OnboardingThemeStyle)
    
    /// Actual theme with its properties
    public var style: OnboardingThemeStyle {
        switch self {
        case .default:
            return OnboardingThemeStyle()
        case .custom(let style):
            return style
        }
    }
}


//MARK: Structure of customization attributes for onboarding flow
///Provides attributes for customization process on the View

public struct OnboardingThemeStyle{
    // MARK: Properties
    ///Text-based properties
    public let titleFont: Font
    public let subtitleFont: Font
    public let descriptionFont: Font
    
    ///Color-based properties
    public let backgroundColor: Color?
    public let titleTextColor: Color?
    public let subtitleTextColor: Color?
    public let descriptionTextColor: Color?
    public let preferedColorTheme: ColorScheme?
    
    
    // MARK: Initialiazer
    ///Custom init
    public init(titleFont: Font, subtitleFont: Font, descriptionFont: Font, backgroundColor: Color?, titleTextColor: Color?, subtitleTextColor: Color?, descriptionTextColor: Color?, preferedColorTheme: ColorScheme?) {
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.descriptionFont = descriptionFont
        self.backgroundColor = backgroundColor
        self.titleTextColor = titleTextColor
        self.subtitleTextColor = subtitleTextColor
        self.descriptionTextColor = descriptionTextColor
        self.preferedColorTheme = preferedColorTheme
    }
    
    ///Default init
    init(){
        self.init(titleFont: .title3.bold(), subtitleFont: .headline, descriptionFont: .subheadline, backgroundColor: nil, titleTextColor: nil, subtitleTextColor: nil, descriptionTextColor: nil, preferedColorTheme: .dark)
    }
}
