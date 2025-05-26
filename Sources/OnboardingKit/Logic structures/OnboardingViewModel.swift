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
open class OnboardingViewModel{
    
    // MARK: Properties
    /// Special structure for Onboarding View
    public struct State{
        // MARK: Properties
        public let allSteps: [OnboardingSlide]
        /// The current onboarding step shown in the view.
        public var currentStepIndex: Int = 0
        public var currentStep: OnboardingSlide {
            allSteps[currentStepIndex]
        }
        /// Variable to know if skip bttn is needed to be shown
        public var showSkipConfirmation: Bool {
            currentStepIndex < allSteps.count - 1 //&& currentStepIndex != 0
        }
        
        // MARK: Initializer
        public init(allSteps: [OnboardingSlide], currentStepIndex: Int) {
            self.allSteps = allSteps
            self.currentStepIndex = currentStepIndex
        }
    }
    /// Property for the current statr on the View
    public var state: State
    
    // MARK: Initializer
    public init(state: State) {
        precondition(!state.allSteps.isEmpty, "OnboardingViewModel: allSteps must not be empty")
        self.state = state
    }
    
    // MARK: Methods
    // MARK: Override in your VM
    /// Navigation to the next Step if you are not at the last step
    open func goToNextStep(){}
    
    /// Skip all steps of the onboarding flow to the last one
    open func skipOnboarding(){}
}
