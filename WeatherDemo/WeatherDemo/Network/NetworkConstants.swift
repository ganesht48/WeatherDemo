//
//  NetworkConstants.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 11/09/24.
//

import Foundation

enum NetworkConstants {
    static let version = "v1"
    static let url = "https://api.weatherapi.com/"

    static var baseUrl: String {
        return url + version
    }
}
