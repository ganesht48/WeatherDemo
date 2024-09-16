//
//  WeatherDashboardViewModel.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 10/09/24.
//

import Foundation
import Combine
import SwiftUI

class WeatherDashboardViewModel: ObservableObject {
    @Published var weatherMetrics: WeatherMetrics?
    @Published var weatherResponse: WeatherResponse?
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    
    let dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies

        $searchText
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)  // Debounce to prevent too many searches
            .removeDuplicates()
            .sink { [weak self] searchText in
                guard searchText.count > 3 else {
                    self?.isLoading = false
                    self?.weatherMetrics = nil
                    return
                }
                self?.fetchWeather(searchText: searchText)
            }
            .store(in: &cancellables)

    }
    
    func fetchWeather(searchText: String) {
        isLoading = true
        weatherMetrics = nil

        dependencies.getSearchCityDataIncludingHours(searchText: searchText)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                self?.weatherResponse = nil
                switch completion {
                case .finished:
                    break  // Handle successful completion if needed
                case .failure(let error):
                    print("Error fetching weather data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                // Handle the successfully decoded WeatherResponse object here
                let weatherMetrics = self?.convertToWeatherMetrics(from: response)
                self?.weatherMetrics = weatherMetrics
            })
            .store(in: &cancellables)  // Store the subscription to manage memory
    }
}


extension WeatherDashboardViewModel {
    func convertToWeatherMetrics(from response: WeatherResponse) -> WeatherMetrics {
        let current = response.current
        let forecast = response.forecast.forecastday.first // Assuming you want the first forecast day

        // Create WeatherMetrics object
        let weatherMetrics = WeatherMetrics(
            humidity: "\(current.humidity)%",
            temperature: current.tempC,
            windSpeed: "\(current.windKph) kph",
            pressure: current.pressureMb,
            description: current.condition.text, // Assuming condition.text contains the description
            hourlyForecast: forecast?.hour.map { hourly in
                HourlyForecast(time: hourly.time, temperature: hourly.tempC, condition: WeatherMetricsCondition(from: hourly.condition))
            } ?? [],
            name: response.location.name,
            region: response.location.region,
            country: response.location.country,
            uvIndex: "\(current.uv)",
            feelsLikeTemperature: "\(current.feelslikeC)°C",
            airPressure: "\(current.pressureMb) mb",
            visibility: "\(current.visKm) km",
            sunriseTime: "\(forecast?.astro.sunrise ?? "")",
            sunsetTime: "\(forecast?.astro.sunset ?? "")"
        )
        
        return weatherMetrics
    }

}
