//
//  WeathBasicInformationView.swift
//  WeatherDemo
//
//  Created by Ganesh.T on 10/09/24.
//

import SwiftUI

struct WeatherBasicInformationView: View {
    @State var title: String
    @State var details: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(Style.Fonts.titleTextFont)
                .bold()
            Text(details)
                .font(Style.Fonts.detailsTextFont)
        }
    }
}

