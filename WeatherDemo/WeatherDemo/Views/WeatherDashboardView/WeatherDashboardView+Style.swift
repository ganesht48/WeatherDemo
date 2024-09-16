//
//  WeatherDashboardView+Style.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import SwiftUI

extension WeatherDashboardView {
    enum Style {
        enum Colors {
            static let backgroundColor = Color(.systemGray6)
            static let stackViewBackgroundColor = Color(.systemGray5)
        }

        enum Radiuses {
            static let cornerRadius = 12.0
        }
        enum Sizes {
            static let staciVerticalSpace = 20.0
            static let gridSpacing = 20.0
            static let contentHorizontalPadding = 12.0
            static let contentVerticalPadding = 12.0

        }

    }
}
