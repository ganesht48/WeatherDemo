//
//  Forecast.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

struct Forecast: Codable {
    let forecastday: [ForecastDay]

    enum CodingKeys: String, CodingKey {
        case forecastday = "forecastday"
    }
}
