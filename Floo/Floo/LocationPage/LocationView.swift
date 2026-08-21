//
//  LocationView.swift
//  Floo
//
//  Created by Windy Claudia Napitupulu on 21/08/26.
//

import SwiftUI

struct LocationView: View {
    private let locations: [LocationCardData] = [
        LocationCardData(
            temperature: "30°C",
            title: "Aulia Tandur A",
            address: "Raja Ampat, West Papua",
            idealTemperature: "Ideal: 20°C - 30°C"
        ),
        LocationCardData(
            temperature: "26°C",
            title: "Windy Tandur",
            address: "Tanah Abang, Jakarta",
            idealTemperature: "Ideal: 20°C - 30°C"
        ),
        LocationCardData(
            temperature: "24°C",
            title: "Windy Tandur",
            address: "Tabanan, Bali",
            idealTemperature: "Ideal: 20°C - 30°C"
        )
    ]

    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Your Location")
                        .appTextStyle(.largeTitleBold, color: .appTextPrimary)
                        .padding(.top, 88)

                    VStack(spacing: 18) {
                        ForEach(locations) { location in
                            LocationCardView(location: location)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    LocationView()
}
