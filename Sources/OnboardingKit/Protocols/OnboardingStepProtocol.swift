//
//  OnboardingStepProtocol.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 22.05.2025.
//

//// MARK: Protocol for onboarding Step enum using in VM
///// Protocol which must conform any provided Step enum for onboarding flow VM
//
public protocol OnboardingSlideStepProtocol: CaseIterable, Hashable{
    /// Current slide info due to its index
    var slide: OnboardingSlide { get }
    /// Indicates whether this step is the last step in the onboarding flow.
    var isLast: Bool { get }
}

