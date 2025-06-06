//
//  PrimaryButtonStyle.swift
//  FocusTimeUI
//
//  Created by Maksym Horobets on 14.05.2025.
//  Modified by Lisa Sydorova on 29.05.2025

import SwiftUI

/// A bold, full-width capsule button used in the FocusTime app.
///
/// - Appearance:
///   - Background: solid blue fill.
///   - Shape: capsule-clip for rounded ends.
///   - Expands to the maximum available width of its container.
///
/// - Usage:
///   Apply this style to any SwiftUI `Button` where you need a prominent call-to-action. For example:
///   ```swift
///   Button("Start Focus Session") { ... }
///       .buttonStyle(PrimaryButtonStyle())
///   ```
public struct PrimaryButtonStyle: ButtonStyle {
    
    // MARK: Properties
    /// Background color of the button
    public let backgroundColor: Color
    /// Text color of the label
    public let foregroundColor: Color
    /// Vertical padding
    public let verticalPadding: CGFloat
    /// Horizontal padding
    public let horizontalPadding: CGFloat
    /// Corner shape
    public let cornerRadius: CGFloat
    /// Pressed state opacity
    public let pressedOpacity: Double
    
    
    // MARK: Initializer
    /// Initializes the primary button style
    public init(
        backgroundColor: Color = .blue,
        foregroundColor: Color = .white,
        verticalPadding: CGFloat = 7,
        horizontalPadding: CGFloat = 0,
        cornerRadius: CGFloat = 22,
        pressedOpacity: Double = 0.8
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.cornerRadius = cornerRadius
        self.pressedOpacity = pressedOpacity
    }
    
    //MARK: Methods
    /// Builds the button's body.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, verticalPadding)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .opacity(configuration.isPressed ? pressedOpacity : 1)
            .padding(.horizontal, horizontalPadding)
    }
}
