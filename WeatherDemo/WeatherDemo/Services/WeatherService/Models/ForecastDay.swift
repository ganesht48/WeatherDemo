//
//  ForecastDay.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

struct ForecastDay: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
        case astro
        case hour
    }
}
