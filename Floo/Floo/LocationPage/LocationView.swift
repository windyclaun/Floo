//
//  LocationView.swift
//  Floo
//
//  Created by Windy Claudia Napitupulu on 21/08/26.
//

import SwiftUI

struct LocationView: View {
    private let location = LocationCardData.sample

    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Your Location")
                        .appTextStyle(.largeTitleBold, color: .appTextPrimary)
                        .padding(.top, 20)

                    VStack(spacing: 18) {
                        ForEach(0..<3, id: \.self) { _ in
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
