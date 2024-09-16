//
//  NetworkManager.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 10/09/24.
//

import Foundation
import Combine

class ConcreteNetworkManager {
    static let instance = ConcreteNetworkManager()
    private init() {}  // Private initializer to enforce singleton pattern

    private var cancellables = Set<AnyCancellable>()  // Store cancellables for Combine subscriptions

    func getAPIData<T: Decodable>(
        for type: T.Type = T.self,
        url: String,
        requestType: RequestType
    ) -> AnyPublisher<T, Error> {
        // URL encoding to handle special characters
        guard let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let urlObj = URL(string: encodedUrl) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }

        // Handle different request types (as of now, only GET is supported)
        guard requestType == .GET else {
            return Fail(error: URLError(.unknown))
                .eraseToAnyPublisher()
        }

        var request = URLRequest(url: urlObj)
        request.httpMethod = requestType.rawValue

        // Fetch data from API using Combine
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    let errorObj = try? JSONDecoder().decode(GenericError.self, from: data)
                    let errorMessage = errorObj?.message ?? "Unknown error occurred."
                    throw NSError(domain: "", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

