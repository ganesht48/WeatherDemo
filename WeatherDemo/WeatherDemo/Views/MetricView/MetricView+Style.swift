//
//  MetricView+Style.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import SwiftUI

extension MetricView {
    enum Style {
        enum Colors {
            static let backgroundColor = Color(.systemGray6)
        }
        enum Fonts {
            static let titleTextFont = Font.caption
            static let valueTextFont = Font.subheadline
            static let imageFont = Font.largeTitle
        }
        
        enum Sizes {
            static let verticalSpace = 4.0
        }
        enum Radiuses {
            static let cornerRadius = 12.0
        }
    }
}
