//
//  WeatherDashboardView.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 10/09/24.
//

import SwiftUI
import Combine

extension WeatherDashboardView {
    typealias Dependencies = WeatherService
}

struct WeatherDashboardView: View {
    @ObservedObject private var viewModel: WeatherDashboardViewModel
    @State private var weatherMetrics: WeatherMetrics?
    @State private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: WeatherDashboardViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: Style.Sizes.staciVerticalSpace) {
                    SearchView(searchText: $viewModel.searchText)
                    if let metrics = weatherMetrics {
                        VStack(spacing: Style.Sizes.contentVerticalPadding) {
                            VStack(alignment: .leading) {
                                WeatherBasicInformationView(title: metrics.name, details: "\(metrics.region), \(metrics.country)")
                            }
                            .padding()
                            .background(Style.Colors.backgroundColor)
                            .cornerRadius(Style.Radiuses.cornerRadius)
                            
                            // Sunrise/Sunset Section
                            HStack {
                                VStack {
                                    Text("Sunrise")
                                    Text(metrics.sunriseTime)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack {
                                    Text("Sunset")
                                    Text(metrics.sunsetTime)
                                        .bold()
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(Style.Radiuses.cornerRadius)
                            
                            // Other Metrics Grid
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: Style.Sizes.gridSpacing) {
                                MetricView(title: "UV", value: metrics.uvIndex, icon: "sun.max.fill")
                                MetricView(title: "Feels like", value: metrics.feelsLikeTemperature, icon: "thermometer")
                                MetricView(title: "Humidity", value: metrics.humidity, icon: "drop.fill")
                                MetricView(title: "Wind", value: metrics.windSpeed, icon: "wind")
                                MetricView(title: "Air pressure", value: metrics.airPressure, icon: "gauge")
                                MetricView(title: "Visibility", value: metrics.visibility, icon: "eye.fill")
                            }
                            
                            //Hourly View
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack {
                                    ForEach(metrics.hourlyForecast, id: \.time) { forecast in
                                        HourView(forecast: forecast)
                                    }
                                    .padding(Style.Sizes.contentHorizontalPadding)
                                }
                                .background(Color(.systemGray6))
                                .cornerRadius(Style.Radiuses.cornerRadius)
                            }
                        }
                        .padding()
                    }
                    else if $viewModel.searchText.wrappedValue.isEmpty {
                        VStack {
                            Spacer()
                            Text("Please enter location in the search field")
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Style.Colors.stackViewBackgroundColor)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Style.Colors.stackViewBackgroundColor)

        }
        .onAppear {
            bind()
        }
    }
    
    private func bind() {
        // Subscribe to weatherMetrics changes from the viewModel
        viewModel
            .$weatherMetrics
            .receive(on: RunLoop.main)  // Ensure updates are on the main thread
            .sink { [self] newMetrics in  // Use strong reference to self
                self.weatherMetrics = newMetrics  // Update the @State property
            }
            .store(in: &cancellables)  // Use @State for storing cancellables
    }
}
