//
//  SlideOnboardingViewModel.swift
//  FocusTime
//
//  Created by Keto Nioradze on 19.05.25.
//  Modified by Lisa Sydorova on 21.05.25


import SwiftUI
import Observation
import OnboardingKit

// MARK: - OnboardingStep Enum
/// Represents each step in the onboarding flow.
/// Each case provides associated subtitles and image name.
enum SlideOnboardingStep: CaseIterable {
    
    case step1, step2, step3, step4
    
    /// Current slide info due to its index
    var slide: OnboardingSlide {
        switch self {
        case .step1:
            return OnboardingSlide(slideTitle: "RIDE THE WAVES OF PRODUCTIVITY", subtitle: "Wave Cycles", subtitleDescription: "25-minute focus sessions followed by 5-minute recovery breaks, modeled after the natural rhythm of ocean waves", imageName: "SlideOnboardingImage")
        case .step2:
            return OnboardingSlide(slideTitle: "RIDE THE WAVES OF PRODUCTIVITY", subtitle: "Tide Blocker", subtitleDescription: "Automatically silences notifications and blocks distracting apps during your focus sessions, keeping your mental waters clear", imageName: "SlideOnboardingImage")
        case .step3:
            return OnboardingSlide(slideTitle: "RIDE THE WAVES OF PRODUCTIVITY", subtitle: "Current Tracker", subtitleDescription: "Visualize your productivity patterns with intuitive analytics that show your focus trends and improvements over time", imageName: "SlideOnboardingImage")
        case .step4:
            return OnboardingSlide(slideTitle: "RIDE THE WAVES OF PRODUCTIVITY", subtitle: "Ocean of Achievement", subtitleDescription: "Collect unique marine-themed awards as you develop stronger focus habits and reach new productivity depths", imageName: "SlideOnboardingImage")
        }
    }
}

// MARK: - SlideOnboardingViewModel

/// ViewModel managing the state and navigation of onboarding steps.
@Observable
final class SlideOnboardingViewModel:OnboardingViewModel {
    // MARK: Properties
    /// All steps of onboarding flow
    let allSteps: [OnboardingSlide] = SlideOnboardingStep.allCases.map{ $0.slide }
    
    // MARK: Initializer
    override init(state: State = State(allSteps: SlideOnboardingStep.allCases.map{ $0.slide },
                                       currentStepIndex: 0)){
        super.init(state: state)
    }
}
