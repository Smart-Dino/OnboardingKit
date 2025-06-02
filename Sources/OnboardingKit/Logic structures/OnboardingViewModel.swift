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
            currentStepIndex < allSteps.count - 1
        }
        /// State for showing skip alert on the view
        public var showSkipAlert: Bool = false
        
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
        assert(!state.allSteps.isEmpty, "OnboardingViewModel: allSteps must not be empty")
        self.state = state
    }
    
    // MARK: Methods
    // MARK: Methods
    /// Advances to the next onboarding step if not at the last step.
    public func goToNextStep() {
        if state.currentStepIndex < state.allSteps.count - 1 {
            state.currentStepIndex += 1
        }
    }
    
    /// Skips directly to the last onboarding step.
    public func skipOnboarding() {
        state.currentStepIndex = state.allSteps.count - 1
    }
}
