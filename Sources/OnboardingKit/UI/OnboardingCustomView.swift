//
//  OnboardingCustomView.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 22.05.2025.
//

import SwiftUI

// MARK: Public view for the onboarding flow with customable params
public struct SlideOnboardingCustomView: View{
    //MARK: Properties
    /// Onboarding ViewModel
    @State private var viewModel: OnboardingViewModel
    
    ///UI Configurations
    private let nextButtonConfiguration: ButtonUIConfiguration
    private let startAppButtonConfiguration: ButtonUIConfiguration
    private let progressBarConfiguration: ProgressBarUIConfiguration
    
    /// Theme for colors and text
    private let themeStyle: OnboardingThemeStyle
    
    /// Buttons for onboarding flow
    private let nextButton: AnyView
    private let startAppButton: AnyView
    
    /// ProgressBar for onboarding flow
    private let progressBar: AnyView
    
    
    //MARK: Initializer
    public init(viewModel: OnboardingViewModel,
                nextButtonConfiguration: ButtonUIConfiguration,
                startAppButtonConfiguration: ButtonUIConfiguration,
                progressBarConfiguration: ProgressBarUIConfiguration,
                themeStyle: OnboardingThemeStyle
    ) {
        self.viewModel = viewModel
        self.nextButtonConfiguration = nextButtonConfiguration
        self.startAppButtonConfiguration = startAppButtonConfiguration
        self.progressBarConfiguration = progressBarConfiguration
        self.themeStyle = themeStyle
        
        
        self.nextButton = CustomButtonView(title: nextButtonConfiguration.title,
                                           action: nextButtonConfiguration.action,
                                           buttonStyle: nextButtonConfiguration.buttonStyle).button
        self.startAppButton = CustomButtonView(title: startAppButtonConfiguration.title,
                                               action: startAppButtonConfiguration.action,
                                               buttonStyle: startAppButtonConfiguration.buttonStyle).button
        self.progressBar = CustomProgressBarView(items: progressBarConfiguration.items,
                                                 selectedItem: progressBarConfiguration.selectedItem,
                                                 activeColor: progressBarConfiguration.activeColor,
                                                 inactiveColor: progressBarConfiguration.inactiveColor).progressBar
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
                        viewModel.state.showSkipAlert = true
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
        .alert(String(localized: "skip_alert_title", bundle: .module), isPresented: $viewModel.state.showSkipAlert) {
            Button(String(localized: "skip", bundle: .module), role: .destructive) {
                viewModel.skipOnboarding()
            }
            Button(String(localized: "cancel", bundle: .module), role: .cancel) {}
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeStyle.backgroundColor).ignoresSafeArea(.all)
    }
}
