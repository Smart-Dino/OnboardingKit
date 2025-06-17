//
//  SlideOnboardingView.swift
//  FocusTime
//
//  Created by Keto Nioradze on 19.05.25.
//  Modified by Lisa Sydorova on 21.05.25

import SwiftUI
import OnboardingKit

// MARK: - SlideOnboardingView
struct SlideOnboardingView: View{
    var builder = LiveOnboardingBuilder()
    var body: some View {
        builder
            .setViewModel(SlideOnboardingStep.allCases.map{ $0.slide})
            .setNextButtonConfiguration(ButtonUIConfiguration(title: "Next",
                                                              buttonStyle: PrimaryButtonStyle()))
            .setStartAppButtonConfiguration(ButtonUIConfiguration(title: "Start Focusing",
                                                                  buttonStyle: PrimaryButtonStyle(),
                                                                  {print("Start Focusing")}))
            .setSizeUIConfiguration(SizeUIConfiguration(
                upperSpacerHeight: 40,
                lowerSpacerHeight: 40
            ))
            .setProgressBarConfiguration(ProgressBarUIConfiguration())
            .setThemeStyle(OnboardingThemeStyle(skipButtonTextColor: .blue))
            .buildView()
    }
}
#Preview {
    SlideOnboardingView()
}
