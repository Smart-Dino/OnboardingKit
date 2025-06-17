//
//  OnboardingTheme.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 23.05.2025.
//

import SwiftUI

//MARK: Structure of customization attributes for onboarding flow
///Provides attributes for customization process on the View

public struct OnboardingThemeStyle{
    // MARK: Properties
    ///Text-based properties
    public let titleFont: Font
    public let subtitleFont: Font
    public let descriptionFont: Font
    public let secondaryTextAlignment: TextAlignment
    public let textHorizontalAlignment: HorizontalAlignment
    
    
    ///Color-based properties
    public let backgroundColor: Color?
    public let titleTextColor: Color?
    public let subtitleTextColor: Color?
    public let skipButtonTextColor: Color?
    public let descriptionTextColor: Color?
    public let preferedColorTheme: ColorScheme?
    
    ///Background view property
    public let backgroundView: AnyView?
    
    // MARK: Initialiazer
    ///Custom init
    public init(titleFont: Font = .title3.bold(),
                subtitleFont: Font = .headline,
                descriptionFont: Font = .subheadline,
                secondaryTextAlignment: TextAlignment = .center,
                textHorizontalAlignment: HorizontalAlignment = .center,
                backgroundColor: Color? = nil,
                titleTextColor: Color? = nil,
                subtitleTextColor: Color? = nil,
                skipButtonTextColor: Color? = nil,
                descriptionTextColor: Color? = nil,
                preferedColorTheme: ColorScheme? = .dark,
                backgroundView: AnyView? = nil
    ) {
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.descriptionFont = descriptionFont
        self.secondaryTextAlignment = secondaryTextAlignment
        self.textHorizontalAlignment = textHorizontalAlignment
        
        self.backgroundColor = backgroundColor
        self.titleTextColor = titleTextColor
        self.subtitleTextColor = subtitleTextColor
        self.skipButtonTextColor = skipButtonTextColor
        self.descriptionTextColor = descriptionTextColor
        self.preferedColorTheme = preferedColorTheme
        self.backgroundView = backgroundView
    }
}
