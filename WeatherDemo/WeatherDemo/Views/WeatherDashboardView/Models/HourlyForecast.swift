//
//  HourlyForecast.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

struct HourlyForecast: Codable {
    let time: String
    let temperature: Double
    let condition: WeatherMetricsCondition
}
