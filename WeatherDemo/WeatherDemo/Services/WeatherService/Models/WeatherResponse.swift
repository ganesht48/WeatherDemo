//
//  WeatherResponse.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}
