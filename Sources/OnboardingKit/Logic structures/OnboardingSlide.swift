//
//  OnboardingSlide.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 21.05.2025.
// 

// MARK: OnboardingSlide structure
import SwiftUI

/// Representing an onboarding slide, which include:
/// Title of the whole slide, Subtitle of App's feature, Description of App's feature, Image name for  App's feature
public struct OnboardingSlide: Hashable {
    // MARK: Properties
    public let slideTitle: String
    public let subtitle: String
    public let subtitleDescription: String
    
    public let imageName: String?
    
    public let customView: AnyView?
    
    public let imageAlignment: Alignment
    public let imageContentMode: ContentMode
    
    // MARK: Initializers
    public init(
        slideTitle: String,
        subtitle: String,
        subtitleDescription: String,
        imageName: String,
        imageAlignment: Alignment = .center,
        imageContentMode: ContentMode = .fit
    ) {
        self.slideTitle = slideTitle
        self.subtitle = subtitle
        self.subtitleDescription = subtitleDescription
        self.imageName = imageName
        self.customView = nil
        self.imageAlignment = imageAlignment
        self.imageContentMode = imageContentMode
    }
    
    public init(
        slideTitle: String,
        subtitle: String,
        subtitleDescription: String,
        customView: AnyView,
        imageAlignment: Alignment = .center,
        imageContentMode: ContentMode = .fit
    ) {
        self.slideTitle = slideTitle
        self.subtitle = subtitle
        self.subtitleDescription = subtitleDescription
        self.imageName = nil
        self.customView = customView
        self.imageAlignment = imageAlignment
        self.imageContentMode = imageContentMode
    }
    
    // MARK: Hashable Conformance
    public func hash(into hasher: inout Hasher) {
            hasher.combine(slideTitle)
            hasher.combine(subtitle)
            hasher.combine(subtitleDescription)
            hasher.combine(imageName)
        }
    
    public static func == (lhs: OnboardingSlide, rhs: OnboardingSlide) -> Bool {
        return lhs.slideTitle == rhs.slideTitle &&
               lhs.subtitle == rhs.subtitle &&
               lhs.subtitleDescription == rhs.subtitleDescription &&
               lhs.imageName == rhs.imageName
    }
}
