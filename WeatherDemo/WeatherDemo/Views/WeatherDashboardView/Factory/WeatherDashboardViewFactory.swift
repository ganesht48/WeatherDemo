//
//  WeatherDashboardViewFactory.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

enum WeatherDashboardViewFactory {
    static func create(
        dependencies: WeatherDashboardViewModel.Dependencies) -> WeatherDashboardView {
            let viewModel = WeatherDashboardViewModel(dependencies: dependencies)
            let weatherDashbordView = WeatherDashboardView(viewModel: viewModel)
            return weatherDashbordView
    }
}
