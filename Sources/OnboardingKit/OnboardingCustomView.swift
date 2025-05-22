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
    
    //MARK: Initializer
    public init(viewModel: VM,
                @ViewBuilder nextButton: () -> NextButtonContent,
                @ViewBuilder startAppButton: () -> StartButtonContent,
                @ViewBuilder progressBar: () -> ProgressBarContent) {
        self.viewModel = viewModel
        self.nextButton = nextButton()
        self.startAppButton = startAppButton()
        self.progressBar = progressBar()
    }
    
    // MARK: - Body
    public var body: some View {
        VStack {
            // MARK: - Header Section
            VStack {
                /// Main title for the onboarding flow
                Text(viewModel.currentStep.slide.slideTitle)
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)
                
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
                    .font(.headline)
                /// Second subtitle line, lighter with subHeadline font
                Text(viewModel.currentStep.slide.subtitleDescription)
                    .font(.subheadline)
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
        .preferredColorScheme(.dark)
        
        // MARK: - Skip Confirmation Alert
        .alert("Do you really want to skip onboarding?", isPresented: $viewModel.showSkipConfirmation) {
            Button("Skip", role: .destructive) {
                viewModel.skipOnboarding()
            }
            Button("No", role: .cancel) {}
        }
    }
}
