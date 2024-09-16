//
//  CachedAsyncImageView.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import SwiftUI

struct CachedAsyncImageView: View {
    @StateObject private var loader: AsyncImageLoader
    private let placeholder: Image
    private let url: String
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.url = url
        self.placeholder = placeholder
        _loader = StateObject(wrappedValue: AsyncImageLoader())  // Initialize loader here
    }

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .onAppear {
                loader.loadImage(from: url)  // Load image when view appears
            }
            .onDisappear {
                loader.cancel()  // Cancel loading when view disappears
            }
    }

    private var image: Image {
        if let image = loader.image {
            return Image(uiImage: image)
        } else {
            return placeholder
        }
    }
}
