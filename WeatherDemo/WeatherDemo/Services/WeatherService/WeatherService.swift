//
//  WeatherService.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 11/09/24.
//

import Foundation
import Combine

protocol WeatherService: AnyObject  {
    func getSearchCityDataIncludingHours(searchText: String) -> AnyPublisher<WeatherResponse, Error>
}

public class ConcreteWeatherService: WeatherService {

    func getSearchCityDataIncludingHours(searchText: String) -> AnyPublisher<WeatherResponse, Error> {
        let url = String(format: NetworkEndPoints.weatherDetailsWithHours, searchText)

        return ConcreteNetworkManager.instance.getAPIData(for: WeatherResponse.self, url: url, requestType: .GET)
    }
}

