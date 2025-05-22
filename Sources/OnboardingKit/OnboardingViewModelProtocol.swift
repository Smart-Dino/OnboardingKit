//
//  OnboardingViewModelProtocol.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 22.05.2025.
//

import SwiftUI
// MARK: Protocol for onboarding ViewModel
/// Protocol which must conform any provided ViewModel for onboarding flow

@available(iOS 17.0, *)
public protocol OnboardingViewModelProtocol: Observable{
    // MARK: Properties
    /// Associated type for Step enum in VM
    associatedtype SlideStep: OnboardingSlideStepProtocol & Equatable
    /// The current onboarding step shown
    var currentStep: SlideStep { get set }
    /// The current onboarding step index shown
    var currentStepIndex: Int { get set }
    /// Variable to know if skip bttn is needed to be shown
    var showSkipConfirmation: Bool { get set }
    
    // MARK: Methods
    /// Navigation to the next Step
    func goToNextStep()
    /// Skip all steps of the onboarding flow
    func skipOnboarding()
}
