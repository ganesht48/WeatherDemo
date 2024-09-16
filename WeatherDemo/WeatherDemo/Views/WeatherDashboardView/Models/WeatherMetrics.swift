//
//  WeatherMetrics.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

struct WeatherMetrics: Codable {
    let humidity: String
    let temperature: Double
    let windSpeed: String
    let pressure: Double
    let description: String
    let hourlyForecast: [HourlyForecast]
    let name: String
    let region: String
    let country: String
    let uvIndex: String
    let feelsLikeTemperature: String
    let airPressure: String
    let visibility: String
    let sunriseTime: String
    let sunsetTime: String
}
