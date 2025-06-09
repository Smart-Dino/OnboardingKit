//
//  OnbardingUIElements.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 23.05.2025.
//

import SwiftUI

// MARK: Struct for Buttons for the onboarding flow
///Provides initializers based on ButtonStyles or custom realization
@MainActor
public struct CustomButtonView {
    // MARK: Properties
    public let button: AnyView
    
    // MARK: Initializer
    public init(title: String,
                action:(() -> Void)? = nil,
                buttonStyle: ButtonStyle){
        let button = Button(title){action?()}
            .buttonStyle(buttonStyle)
        self.button = AnyView(button)
    }
}


// MARK: Struct for customisable ProgressBar for the onboarding flow
///Provides initialization for  customisable ProgressBarView according to the VM
@MainActor
public struct CustomProgressBarView {
    // MARK: Properties
    public let progressBar: AnyView
    
    // MARK: Initializer
    public init(items: [Int],
                selectedItem: Binding<Int>,
                activeColor: Color = .white,
                inactiveColor: Color = .gray) {
        self.progressBar = AnyView(
            ProgressBarView(items: items,
                            selectedItem: selectedItem,
                            activeColor: activeColor,
                            inactiveColor: inactiveColor))
    }
}
