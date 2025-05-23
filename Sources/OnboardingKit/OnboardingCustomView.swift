//
//  OnboardingCustomView.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 22.05.2025.
//

import SwiftUI

// MARK: Public view for the onboarding flow with customable params
@available(iOS 17.0, *)
public struct SlideOnboardingCustomView<VM:OnboardingViewModelProtocol, NextButtonContent: View, StartButtonContent: View, ProgressBarContent: View>: View{
    //MARK: Properties
    /// Onboarding ViewModel
    @State private var viewModel: VM
    
    /// Buttons for onboarding flow
    let nextButton: NextButtonContent
    let startAppButton: StartButtonContent
    
    /// ProgressBar for onboarding flow
    let progressBar: ProgressBarContent
    
    /// Theme for colors anf text
    let theme: OnboardingTheme
    private let themeStyle: OnboardingThemeStyle
    
    //MARK: Initializer
    public init(viewModel: VM,
                @ViewBuilder nextButton: () -> NextButtonContent,
                @ViewBuilder startAppButton: () -> StartButtonContent,
                @ViewBuilder progressBar: () -> ProgressBarContent,
                theme: OnboardingTheme = .default
    ) {
        self.viewModel = viewModel
        self.nextButton = nextButton()
        self.startAppButton = startAppButton()
        self.progressBar = progressBar()
        self.theme = theme
        self.themeStyle = theme.style
    }
    
    // MARK: - Body
    public var body: some View {
        VStack {
            // MARK: - Header Section
            VStack {
                /// Main title for the onboarding flow
                Text(viewModel.currentStep.slide.slideTitle)
                    .font(themeStyle.titleFont)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(themeStyle.titleTextColor ?? .primary)
                
                
                /// Placeholder for progress bar UI from package
                Text("PLACEHOLDER FOR PROGRESS BAR")
                    .foregroundColor(.cyan)
                    .background(Color.red)
            }
            
            // MARK: - Image Section
            /// Displays current step's image, fills the frame and clips overflow
            // TODO: - Update image with actual image
            Image(viewModel.currentStep.slide.imageName)
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.vertical, { amount, axis in
                    amount / 1.8
                })
                .clipped()
                .padding(.top, 20)
            
            // MARK: - Subtitle Section
            VStack {
                /// First subtitle line, emphasised with headline font
                Text(viewModel.currentStep.slide.subtitle)
                    .font(themeStyle.subtitleFont)
                    .foregroundStyle(themeStyle.subtitleTextColor ?? .primary)
                /// Second subtitle line, lighter with subHeadline font
                Text(viewModel.currentStep.slide.subtitleDescription)
                    .font(themeStyle.descriptionFont)
                    .foregroundStyle(themeStyle.descriptionTextColor ?? .primary)
                    
            }
            .frame(height: 152)
            .multilineTextAlignment(.center)
            
            
            // MARK: - Buttons
            /// Shows 'Next' and 'Skip' buttons for first 3 steps
            if !viewModel.currentStep.isLast {
                VStack(spacing: 16) {
                    nextButton
                    Button("Skip") {
                        viewModel.showSkipConfirmation = true
                    }
                }
                .frame(height: 78)
                
            } else {
                /// Shows 'Start Focusing' button on the last step
                startAppButton
            }
        }
        .animation(.easeInOut, value: viewModel.currentStep)
        .preferredColorScheme(themeStyle.preferedColorTheme)
        
        // MARK: - Skip Confirmation Alert
        .alert("Do you really want to skip onboarding?", isPresented: $viewModel.showSkipConfirmation) {
            Button("Skip", role: .destructive) {
                viewModel.skipOnboarding()
            }
            Button("No", role: .cancel) {}
        }
        .background(themeStyle.backgroundColor)
    }
}
