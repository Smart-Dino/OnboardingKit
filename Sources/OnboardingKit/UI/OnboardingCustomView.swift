//
//  OnboardingCustomView.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 22.05.2025.
//

import SwiftUI

// MARK: Public view for the onboarding flow with customable params
public struct OnboardingCustomView: View{
    //MARK: Properties
    /// Onboarding ViewModel
    @State private var viewModel: OnboardingViewModel
    
    ///UI Configurations
    private let nextButtonConfiguration: ButtonUIConfiguration
    private let startAppButtonConfiguration: ButtonUIConfiguration
    private let progressBarConfiguration: ProgressBarUIConfiguration
    private var sizeUIConfiguration: SizeUIConfiguration
    
    /// Theme for colors and text
    private let themeStyle: OnboardingThemeStyle
    
    /// Buttons for onboarding flow
    private let nextButton: AnyView
    private let startAppButton: AnyView
    
    /// ProgressBar for onboarding flow
    private let progressBar: AnyView
    
    
    //MARK: Initializer
    init(viewModel: OnboardingViewModel,
         nextButtonConfiguration: ButtonUIConfiguration,
         startAppButtonConfiguration: ButtonUIConfiguration,
         progressBarConfiguration: ProgressBarUIConfiguration,
         sizeUIConfiguration: SizeUIConfiguration,
         themeStyle: OnboardingThemeStyle
    ) {
        self.viewModel = viewModel
        self.nextButtonConfiguration = nextButtonConfiguration
        self.startAppButtonConfiguration = startAppButtonConfiguration
        self.progressBarConfiguration = progressBarConfiguration
        self.sizeUIConfiguration = sizeUIConfiguration
        self.themeStyle = themeStyle
        
        
        self.nextButton = CustomButtonView(title: nextButtonConfiguration.title,
                                           action: nextButtonConfiguration.action,
                                           buttonStyle: nextButtonConfiguration.buttonStyle).button
        self.startAppButton = CustomButtonView(title: startAppButtonConfiguration.title,
                                               action: startAppButtonConfiguration.action,
                                               buttonStyle: startAppButtonConfiguration.buttonStyle).button
        self.progressBar = CustomProgressBarView(items: Array(0...viewModel.state.allSteps.count - 1),
                                                 selectedItem: Binding(get: {viewModel.state.currentStepIndex},
                                                                       set: { _ in}),
                                                 activeColor: progressBarConfiguration.activeColor,
                                                 inactiveColor: progressBarConfiguration.inactiveColor).progressBar
    }
    
    
    // MARK: - Body
    public var body: some View {
        ZStack {
            // MARK: - Background
            themeStyle.backgroundColor
                .ignoresSafeArea()
            themeStyle.backgroundView
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Header Section
                VStack {
                    /// Main title for the onboarding flow
                    Text(viewModel.state.currentStep.slideTitle)
                        .font(themeStyle.titleFont)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(themeStyle.titleTextColor ?? .primary)
                    
                    /// Progress bar UI from package
                    progressBar
                        .padding(sizeUIConfiguration.progressBarPadding)
                }
                .padding(.bottom, sizeUIConfiguration.headerBottomPadding)
                
                // MARK: - Image Section
                /// Displays current step's image, fills the frame and clips overflow
                // TODO: - Update image with actual image
                Image(viewModel.state.currentStep.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: sizeUIConfiguration.imageWidth, height: sizeUIConfiguration.imageHeight)
                    .clipped()
                    .padding(.top, sizeUIConfiguration.imageTopPadding)
                
                
                // MARK: - Subtitle Section
                VStack(alignment: themeStyle.textHorizontalAlignment) {
                    /// First subtitle line, emphasised with headline font
                    Text(viewModel.state.currentStep.subtitle)
                        .font(themeStyle.subtitleFont)
                        .foregroundStyle(themeStyle.subtitleTextColor ?? .primary)
                    
                    /// Second subtitle line, lighter with subHeadline font
                    Text(viewModel.state.currentStep.subtitleDescription)
                        .font(themeStyle.descriptionFont)
                        .foregroundStyle(themeStyle.descriptionTextColor ?? .primary)
                }
                .multilineTextAlignment(themeStyle.secondaryTextAlignment)
                .frame(height: sizeUIConfiguration.textContainerHeight)
                .padding(.horizontal)
                .padding(.bottom, sizeUIConfiguration.textBottomPadding)
                
                // MARK: - Buttons
                /// Shows 'Next' and 'Skip' buttons for first 3 steps
                
                VStack(spacing: 16) {
                    if (viewModel.state.showSkipConfirmation) {
                        nextButton
                        Button(String(localized: "skip", bundle: .module)) {
                            viewModel.state.showSkipAlert = true
                        }
                        .foregroundStyle(themeStyle.skipButtonTextColor ?? .secondary)
                    } else {
                        /// Shows 'Start Focusing' button on the last step
                        startAppButton
                    }
                }
                .frame(height: sizeUIConfiguration.buttonContainerHeight)
                .padding(.horizontal)
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
        }
    }
}
