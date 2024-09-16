//
//  SearchView+Style.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import SwiftUI

extension SearchView {
    enum Style {
        enum Colors {
            static let backgroundColor = Color(.systemGray6)
            static let foregroundColor = Color(.gray)            
        }
        enum Sizes {
            static let verticalSpace = 12.0
            static let horizontalSpace = 24.0
            static let imageViewHorizontalSpace = 8.0
            static let contentHorizontalPadding = 12.0
        }
        
        enum Radiuses {
            static let cornerRadius = 12.0
        }
    }
}
