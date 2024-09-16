//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 10/09/24.
//

import SwiftUI

@main
struct WeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let dependencies = ConcreteWeatherService()
            return WeatherDashboardViewFactory.create(dependencies: dependencies)
        }
    }
}
