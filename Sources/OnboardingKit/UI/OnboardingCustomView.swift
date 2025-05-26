//
//  OnboardingCustomView.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 22.05.2025.
//

import SwiftUI

// MARK: Public view for the onboarding flow with customable params
@available(iOS 17.0, *)
public struct SlideOnboardingCustomView: View{
    //MARK: Properties
    /// Onboarding ViewModel
    @State private var viewModel: OnboardingViewModel
    
    /// Show Skip Button
    @State private var showAlertSkipBinding: Bool = false
    
    /// Buttons for onboarding flow
    let nextButton: AnyView
    let nextButtonStyle: ButtonViewStyle
    let startAppButton: AnyView
    let startAppButtonStyle: ButtonViewStyle
    
    /// ProgressBar for onboarding flow
    let progressBar: AnyView
    let progressBarStyle: ProgressBarViewStyle
    
    /// Theme for colors anf text
    let theme: OnboardingTheme
    private let themeStyle: OnboardingThemeStyle
    
    //MARK: Initializer
    public init(viewModel: OnboardingViewModel,
                nextButtonStyle: ButtonViewStyle,
                startAppButtonStyle: ButtonViewStyle,
                progressBarStyle: ProgressBarViewStyle,
                theme: OnboardingTheme = .default
    ) {
        self.viewModel = viewModel
        
        self.nextButtonStyle = nextButtonStyle
        self.nextButton = nextButtonStyle.button
        
        self.startAppButtonStyle = startAppButtonStyle
        self.startAppButton = startAppButtonStyle.button
        
        self.progressBarStyle = progressBarStyle
        self.progressBar = progressBarStyle.progressBar
        self.theme = theme
        self.themeStyle = theme.style
    }

    
    // MARK: - Body
    public var body: some View {
        VStack {
            // MARK: - Header Section
            VStack {
                /// Main title for the onboarding flow
                Text(viewModel.state.currentStep.slideTitle)
                    .font(themeStyle.titleFont)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(themeStyle.titleTextColor ?? .primary)
                
                
                /// Placeholder for progress bar UI from package
                progressBar
            }
            
            // MARK: - Image Section
            /// Displays current step's image, fills the frame and clips overflow
            // TODO: - Update image with actual image
            Image(viewModel.state.currentStep.imageName)
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.vertical, { amount, _ in
                    amount / 1.8
                })
                .clipped()
                .padding(.top, 20)
            
            // MARK: - Subtitle Section
            VStack {
                /// First subtitle line, emphasised with headline font
                Text(viewModel.state.currentStep.subtitle)
                    .font(themeStyle.subtitleFont)
                    .foregroundStyle(themeStyle.subtitleTextColor ?? .primary)
                /// Second subtitle line, lighter with subHeadline font
                Text(viewModel.state.currentStep.subtitleDescription)
                    .font(themeStyle.descriptionFont)
                    .foregroundStyle(themeStyle.descriptionTextColor ?? .primary)
                
            }
            .frame(height: 152)
            .multilineTextAlignment(.center)
            
            
            // MARK: - Buttons
            /// Shows 'Next' and 'Skip' buttons for first 3 steps
            if (viewModel.state.showSkipConfirmation) {
                VStack(spacing: 16) {
                    nextButton
                    Button("Skip") {
                        showAlertSkipBinding = true
                    }
                }
                .frame(height: 78)
                
            } else {
                /// Shows 'Start Focusing' button on the last step
                startAppButton
            }
        }
        .animation(.easeInOut, value: viewModel.state.currentStep)
        .preferredColorScheme(themeStyle.preferedColorTheme)
        
        // MARK: - Skip Confirmation Alert
        .alert("Do you really want to skip onboarding?", isPresented: $showAlertSkipBinding) {
            Button("Skip", role: .destructive) {
                viewModel.skipOnboarding()
            }
            Button("No", role: .cancel) {}
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeStyle.backgroundColor).ignoresSafeArea(.all)
        .onChange(of: viewModel.state.currentStep) { newStep in
            print("SlideOnboardingCustomView received new step: \(newStep)")
        }
    }
}
