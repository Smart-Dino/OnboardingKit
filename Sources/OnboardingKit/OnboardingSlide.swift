//
//  OnboardingSlide.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 21.05.2025.
//

// MARK: OnboardingSlide structure

/// Representing an onboarding slide, which include:
/// Title of the whole slide, Subtitle of App's feature, Description of App's feature, Image name for  App's feature

public struct OnboardingSlide{
    // MARK: Properties
    public var slideTitle: String
    public var subtitle: String
    public var subtitleDescription: String
    public var imageName: String
    
    // MARK: Initializer
    public init(slideTitle: String, subtitle: String, subtitleDescription: String, imageName: String) {
        self.slideTitle = slideTitle
        self.subtitle = subtitle
        self.subtitleDescription = subtitleDescription
        self.imageName = imageName
    }
}

