//
//  OnboardingUIConfiguration.swift
//  OnboardingKit
//
//  Created by Lisa Sydorova on 02.06.2025.
//
import SwiftUI
//MARK: Structs to configure UI on the view
//MARK: Struct for Button configuration
public struct ButtonUIConfiguration{
    //MARK: Properties
    ///Button properties
    public var title: String
    public var action:(() -> Void)?
    public var buttonStyle: ButtonStyle
    
    //MARK: Initializer
    public init(title: String,
                buttonStyle: ButtonStyle,
                _ action:(() -> Void)? = nil)
    {
        self.title = title
        self.action = action
        self.buttonStyle = buttonStyle
    }
}


//MARK: Struct to ProgressBar configuration
public struct ProgressBarUIConfiguration{
    //MARK: Properties
    ///ProgressBar Color properties
    public var activeColor: Color
    public var inactiveColor: Color
    
    //MARK: Initializer
    public init(activeColor: Color = .white,
                inactiveColor: Color = .gray){
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
    }
}


//MARK: Struct to items sizes configuration
public struct SizeUIConfiguration{
    //MARK: Properties
    ///ProgressBar Padding
    public var progressBarPadding: CGFloat
    
    ///Image Configurations
    public var imageHeight: CGFloat
    public var imageTopPadding: CGFloat
    
    ///Text Configuration
    public var textContainerHeight: CGFloat
    public var textHorizontalPadding: CGFloat
    public var textVerticalPadding: CGFloat
    
    /// Spacers
    public var upperSpacerHeight: CGFloat
    public var lowerSpacerHeight: CGFloat
    
    ///Button Configuration
    public var buttonContainerHeight: CGFloat
    
    
    
    //MARK: Initializer
    public init(progressBarPadding: CGFloat = 8,
                imageHeight: CGFloat = 430,
                imageTopPadding: CGFloat = 20,
                textContainerHeight: CGFloat = 152,
                textHorizontalPadding: CGFloat = 16,
                textVerticalPadding: CGFloat = 0,
                upperSpacerHeight: CGFloat = 0,
                lowerSpacerHeight: CGFloat = 0,
                buttonContainerHeight: CGFloat = 78) {
        /// Calculation for adaptive view of different screens
        self.progressBarPadding = progressBarPadding
        
        
        self.imageHeight = imageHeight/852
        
        self.imageTopPadding = imageTopPadding
        
        self.textContainerHeight = textContainerHeight/852
        
        self.textHorizontalPadding = textHorizontalPadding
        self.textVerticalPadding = textVerticalPadding
        
        self.upperSpacerHeight = upperSpacerHeight/852
        self.lowerSpacerHeight = lowerSpacerHeight/852
        
        self.buttonContainerHeight = buttonContainerHeight/852
    }
    
}
