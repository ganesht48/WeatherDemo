//
//  AsyncImageLoader.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import UIKit
import Combine

class AsyncImageLoader: ObservableObject {
    @Published var image: UIImage? = nil  // Publishes the downloaded image
    
    private var cancellable: AnyCancellable?

    func loadImage(from urlString: String) {
        // Check cache first
        if let cachedImage = ImageCacheManager.shared.getImage(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        // If not cached, download the image
        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }  // Convert data to UIImage
            .replaceError(with: nil)  // Replace errors with nil
            .receive(on: DispatchQueue.main)  // Receive on main thread
            .sink { [weak self] downloadedImage in
                guard let self = self, let image = downloadedImage else { return }
                ImageCacheManager.shared.setImage(image, forKey: urlString)  // Cache the image
                self.image = image  // Update the published image
            }
    }

    func cancel() {
        cancellable?.cancel()
    }
}
