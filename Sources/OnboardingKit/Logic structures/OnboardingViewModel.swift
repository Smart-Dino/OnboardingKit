//
//  OnboardingViewModel.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 26.05.2025.
//

import SwiftUI
// MARK: Class for onboarding ViewModel
/// Class with basic logic for future final Onboarding ViewModel
/// Includes connected enum for SlideStep needed for architecture
@available(iOS 17.0, *)
@Observable
open class OnboardingViewModel<SlideStep: OnboardingSlideStepProtocol>{
    // MARK: Properties
    /// The current onboarding step shown
    public var currentStep: SlideStep
    /// Variable to know if skip bttn is needed to be shown
    public var showSkipConfirmation: Bool = false
    
    // MARK: Initializer
    public init(currentStep: SlideStep) {
        self.currentStep = currentStep
    }
    
    // MARK: Methods
    // MARK: Override in your VM
    /// Navigation to the next Step if you are not at the last step
    open func goToNextStep(){}
    
    /// Skip all steps of the onboarding flow to the last one
    open func skipOnboarding(){}
}
