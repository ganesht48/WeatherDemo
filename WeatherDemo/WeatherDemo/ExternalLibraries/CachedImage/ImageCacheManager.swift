//
//  ImageCacheManager.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import UIKit

class ImageCacheManager {
    static let shared = ImageCacheManager()
    
    private init() {}  // Singleton instance

    private let cache = NSCache<NSString, UIImage>()  // In-memory cache

    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}


