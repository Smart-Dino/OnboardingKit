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
    @State private var viewModel = SlideOnboardingViewModel()
    var body: some View {
        SlideOnboardingCustomView(
            viewModel: viewModel,
            nextButton: CustomButtonView(title: "Next",
                                         action: {
                                             viewModel.goToNextStep()
                                             print("Current Locale: \(Locale.current.identifier)")

                                         },
                                         buttonStyle: PrimaryButtonStyle()),
                   
            startAppButton: CustomButtonView(title: "Start Focusing",
                                             action: {},
                                             buttonStyle: PrimaryButtonStyle()),
            progressBar: CustomProgressBarView(
                items: Array(0...viewModel.allSteps.count - 1),
                selectedItem: $viewModel.state.currentStepIndex),
            themeStyle: OnboardingThemeStyle()
        )
    }
}

#Preview {
    SlideOnboardingView()
}
