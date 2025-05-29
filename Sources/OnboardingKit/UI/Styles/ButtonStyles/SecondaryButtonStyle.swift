//
//  SecondaryButtonStyle.swift
//  FocusTimeUI
//
//  Created by Maksym Horobets on 14.05.2025.
//

import SwiftUI

/// A semi-transparent, full-width capsule button used in the FocusTime app.
///
/// - Appearance:
///   - Background: system's UltraThinMaterial material.
///   - Shape: capsule-clip for rounded ends.
///   - Expands to the maximum available width of its container.
///
/// - Usage:
///   Apply this style to any SwiftUI `Button` where you need a secondary call-to-action. For example:
///   ```swift
///   Button("Restore Purchases") { ... }
///       .buttonStyle(SecondaryButtonStyle())
///   ```
public struct SecondaryButtonStyle: ButtonStyle {
    // MARK: Properties
    /// Background color of the button
    public let backgroundMaterial: Material
    /// Vertical padding
    public let verticalPadding: CGFloat
    /// Pressed state opacity
    public let pressedOpacity: Double
    
    
    // MARK: Initializer
    /// Initializes the primary button style.
    public init(
        backgroundMaterial: Material = .regularMaterial,
        verticalPadding: CGFloat = 7,
        pressedOpacity: Double = 0.8
    ) {
        self.backgroundMaterial = backgroundMaterial
        self.verticalPadding = verticalPadding
        self.pressedOpacity = pressedOpacity
    }
    
    /// Builds the button's body.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, verticalPadding)
            .background(backgroundMaterial)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? pressedOpacity : 1)
    }
    
}
