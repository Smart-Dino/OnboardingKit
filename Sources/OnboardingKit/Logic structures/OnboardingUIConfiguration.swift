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
