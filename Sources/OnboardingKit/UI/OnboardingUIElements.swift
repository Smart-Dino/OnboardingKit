//
//  OnbardingUIElements.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 23.05.2025.
//

import SwiftUI

// MARK: Enum for Buttons for the onboarding flow
///Provides cases based on ButtonStyles or custom realization

@available(iOS 17.0, *)
public enum ButtonViewStyle {
    // MARK: Properties
    /// Styles of buttons
    /// Using implemented styles
    case primary(title: String, action:(() -> Void)? = nil)
    case secondary(title: String, action:(() -> Void)? = nil)
    /// Custom view
    case custom(view: View)
    
    @MainActor
    /// Button property
    var button: AnyView {
        switch self {
        case let .primary(title, action):
            return AnyView(
                Button(title) {
                    action?()
                }
                    .buttonStyle(FTPrimaryButtonStyle())
            )
            
        case let .secondary(title, action):
            return AnyView(
                Button(title) {
                    action?()
                }
                    .frame(height: 78)
                    .buttonStyle(FTPrimaryButtonStyle())
            )
            
        case let .custom(view):
            return AnyView(view)
        }
    }
}


// MARK: Enum for ProgressBar for the onboarding flow
///Provides cases based on FTProgressBarView or custom realization
public enum ProgressBarViewStyle<Step: OnboardingSlideStepProtocol> {
    // MARK: Properties
    /// Styles of ProgressBar
    /// Using implemented styles
    case `default`(items: [Step], selected: Step, activeColor: Color, intactiveColor: Color)
    /// Custom view
    case custom(view: View)
    
    /// ProgressBar property
    @MainActor
    var progressBar: AnyView {
        switch self {
        case let .default(items, selected, activeColor, intactiveColor):
            return AnyView(
                FTProgressBarView(items: items,
                                  selectedItem: selected,
                                  activeColor: activeColor,
                                  inactiveColor: intactiveColor)
            )
        case let .custom(view):
            return AnyView(view)
        }
    }
}
