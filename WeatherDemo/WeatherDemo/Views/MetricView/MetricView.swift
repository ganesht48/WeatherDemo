//
//  MetricView.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 10/09/24.
//

import SwiftUI

struct MetricView: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: Style.Sizes.verticalSpace) {
            Image(systemName: icon)
                .font(Style.Fonts.imageFont)
            Text(title)
                .font(Style.Fonts.titleTextFont)
                .bold()
            Text(value)
                .font(Style.Fonts.valueTextFont)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Style.Colors.backgroundColor)
        .cornerRadius(Style.Radiuses.cornerRadius)
    }
}

