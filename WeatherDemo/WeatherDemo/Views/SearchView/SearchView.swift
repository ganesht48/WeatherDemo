//
//  SearchView.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 14/09/24.
//

import Foundation
import SwiftUI

struct SearchView: View {
    var searchText: Binding<String>
    
    var body: some View {
        HStack {
            TextField("Search...", text: searchText)
                .padding(Style.Sizes.verticalSpace)
                .padding(.horizontal, Style.Sizes.horizontalSpace)
                .background(Style.Colors.backgroundColor)
                .cornerRadius(Style.Radiuses.cornerRadius)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Style.Colors.foregroundColor)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, Style.Sizes.imageViewHorizontalSpace)
                        
                        if !searchText.wrappedValue.isEmpty {
                            Button(action: {
                                searchText.wrappedValue = ""  // Clear search text
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Style.Colors.foregroundColor)
                                    .padding(.trailing, Style.Sizes.imageViewHorizontalSpace)
                            }
                        }
                    }
                )
                .padding(.horizontal, Style.Sizes.contentHorizontalPadding)
        }
        .padding(.top)
    }
}
