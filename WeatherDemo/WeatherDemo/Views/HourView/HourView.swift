//
//  HourView.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import SwiftUI

struct HourView: View {
    let forecast: HourlyForecast
    
    var body: some View {
        VStack(spacing: Style.Sizes.verticalSpace) {
            Text(forecast.time.getDate()?.getHour() ?? "")
                .accessibilityIdentifier(AccessibilityIdentifiers.hourViewTime)
            
            CachedAsyncImageView(url: forecast.condition.icon.getUrl(),
                                 placeholder: Image(systemName: "photo"))
                .frame(width: Style.Sizes.imageViewWidth, 
                       height: Style.Sizes.imageViewHeight)
                .clipShape(RoundedRectangle(cornerRadius: Style.Radiuses.cornerRadius))
                .shadow(radius: Style.Radiuses.shadowRadius)
                .padding(.vertical, Style.Sizes.verticalSpace)
                .accessibilityIdentifier(AccessibilityIdentifiers.hourViewIconImage)
            
            Text("\(String(format: "%.1f", forecast.temperature))°")
                .accessibilityIdentifier(AccessibilityIdentifiers.hourViewTemparature)
        }
    }
}
