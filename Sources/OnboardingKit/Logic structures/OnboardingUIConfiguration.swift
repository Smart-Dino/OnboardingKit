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


////MARK: Struct to items sizes configuration
public struct SizeUIConfiguration{
    //MARK: Properties
    ///ProgressBar Padding
    public var progressBarPadding: CGFloat
    
    ///Header Bottom Padding
    public var headerBottomPadding: CGFloat
    
    ///Image Configurations
    public var imageHeight: CGFloat
    public var imageWidth: CGFloat?
    public var imageTopPadding: CGFloat
    
    ///Text Configuration
    public var textContainerHeight: CGFloat
    public var textBottomPadding: CGFloat
    
    ///Button Configuration
    public var buttonContainerHeight: CGFloat
    
    
    
    //MARK: Initializer
    public init(progressBarPadding: CGFloat = 8,
                headerBottomPadding: CGFloat = 0,
                imageHeight: CGFloat = 430,
                imageWidth: CGFloat? = nil,
                imageTopPadding: CGFloat = 20,
                textContainerHeight: CGFloat = 152,
                textBottomPadding: CGFloat = 0,
                buttonContainerHeight: CGFloat = 78) {
        self.progressBarPadding = progressBarPadding
        self.headerBottomPadding = headerBottomPadding
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
        self.imageTopPadding = imageTopPadding
        self.textContainerHeight = textContainerHeight
        self.textBottomPadding = textBottomPadding
        self.buttonContainerHeight = buttonContainerHeight
    }
    
}
