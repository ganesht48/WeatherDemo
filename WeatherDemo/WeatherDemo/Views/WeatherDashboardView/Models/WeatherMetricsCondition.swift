//
//  WeatherMetricsCondition.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation

struct WeatherMetricsCondition: Codable {
    let text: String
    let icon: String
    let code: Int
    
    init(from condition: Condition) {
        self.text = condition.text
        self.icon = condition.icon
        self.code = condition.code
    }
}
