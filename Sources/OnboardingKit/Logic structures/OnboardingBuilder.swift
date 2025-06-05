//
//  OnboardingBuilder.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 05.06.2025.
//
import SwiftUI

// MARK: The Builder interface
/// specifies methods for creating the different parts of the View
private protocol OnboardingBuilderProtocol {
    func setViewModel(_ allSlides: [OnboardingSlide]) -> Self
    func setNextButtonConfiguration(_ nextButtonConfiguration: ButtonUIConfiguration) -> Self
    func setStartAppButtonConfiguration(_ startAppButtonConfiguration: ButtonUIConfiguration) -> Self
    func setProgressBarConfiguration(_ progressBarConfiguration: ProgressBarUIConfiguration) -> Self
    func setThemeStyle(_ themeStyle: OnboardingThemeStyle) -> Self
}


//MARK: Builder for specific implementation of the future View
public class OnboardingBuilder: OnboardingBuilderProtocol{
    
    //MARK: Properties
    /// Onboarding ViewModel
    private var viewModel: OnboardingViewModel?
    
    ///UI Configurations
    private var nextButtonConfiguration: ButtonUIConfiguration?
    private var startAppButtonConfiguration: ButtonUIConfiguration?
    private var progressBarConfiguration: ProgressBarUIConfiguration?
    
    /// Theme for colors and text
    private var themeStyle: OnboardingThemeStyle?
    
    
    //MARK: Initializer
    public init(){}
    
    //MARK: Methods
    public func setViewModel(_ allSlides: [OnboardingSlide]) -> Self {
        var state = OnboardingViewModel.State(allSteps: allSlides, currentStepIndex: 0)
        self.viewModel = OnboardingViewModel(state: state)
        return self
    }
    
    public func setNextButtonConfiguration(_ nextButtonConfiguration: ButtonUIConfiguration) -> Self {
        self.nextButtonConfiguration = nextButtonConfiguration
        self.nextButtonConfiguration?.action = { [weak self] in
            guard let viewModel = self?.viewModel else { return }
            viewModel.goToNextStep()
        }
        return self
    }
    
    public func setStartAppButtonConfiguration(_ startAppButtonConfiguration: ButtonUIConfiguration) -> Self {
        self.startAppButtonConfiguration = startAppButtonConfiguration
        return self
    }
    
    public func setProgressBarConfiguration(_ progressBarConfiguration: ProgressBarUIConfiguration) -> Self {
        self.progressBarConfiguration = progressBarConfiguration
        return self
    }
    
    public func setThemeStyle(_ themeStyle: OnboardingThemeStyle) -> Self {
        self.themeStyle = themeStyle
        return self
    }
    
    @MainActor
    public func buildView() -> some View {
        guard let viewModel = self.viewModel,
              let nextButtonConfiguration = self.nextButtonConfiguration,
              let startAppButtonConfiguration = startAppButtonConfiguration,
              let progressBarConfiguration = progressBarConfiguration,
              let themeStyle = themeStyle
        else {
            fatalError("Missing required configurations")
        }
        
        return OnboardingCustomViewContainer(
            viewModel: viewModel,
            nextButtonConfiguration: nextButtonConfiguration,
            startAppButtonConfiguration: startAppButtonConfiguration,
            progressBarConfiguration: progressBarConfiguration,
            themeStyle: themeStyle
        )
    }
}


//MARK: Container for Custom View
///Helps with react programming
private struct OnboardingCustomViewContainer: View {
    @State private var viewModel: OnboardingViewModel

    private let nextButtonConfiguration: ButtonUIConfiguration
    private let startAppButtonConfiguration: ButtonUIConfiguration
    private let progressBarConfiguration: ProgressBarUIConfiguration
    private let themeStyle: OnboardingThemeStyle

    init(
        viewModel: OnboardingViewModel,
        nextButtonConfiguration: ButtonUIConfiguration,
        startAppButtonConfiguration: ButtonUIConfiguration,
        progressBarConfiguration: ProgressBarUIConfiguration,
        themeStyle: OnboardingThemeStyle
    ) {
        self._viewModel = State(initialValue: viewModel)
        self.nextButtonConfiguration = nextButtonConfiguration
        self.startAppButtonConfiguration = startAppButtonConfiguration
        self.progressBarConfiguration = progressBarConfiguration
        self.themeStyle = themeStyle
    }

    var body: some View {
        OnboardingCustomView(
            viewModel: viewModel,
            nextButtonConfiguration: nextButtonConfiguration,
            startAppButtonConfiguration: startAppButtonConfiguration,
            progressBarConfiguration: progressBarConfiguration,
            themeStyle: themeStyle
        )
    }
}
