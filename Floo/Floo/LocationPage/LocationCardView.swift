//
//  LocationCardView.swift
//  Floo
//
//  Created by Windy Claudia Napitupulu on 21/08/26.
//

import SwiftUI

struct LocationCardView: View {
    let location: LocationCardData
    let width: CGFloat
    let height: CGFloat

    init(location: LocationCardData, width: CGFloat = 353, height: CGFloat = 180) {
        self.location = location
        self.width = width
        self.height = height
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Image("cardLocation")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .background(fallbackGradient)
                .clipped()

            LinearGradient(
                colors: [
                    .black.opacity(0.38),
                    .black.opacity(0.14),
                    .black.opacity(0.03)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )

            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "thermometer.medium")
                        .font(.system(size: 26, weight: .regular))

                    Text(location.temperature)
                        .font(AppTextStyle.largeTitleBold.font)
                        .foregroundStyle(Color.appTextOnPrimary)
                }
                .foregroundStyle(Color.appTextOnPrimary)

                Text(location.title)
                    .font(AppTextStyle.title3Bold.font)
                    .foregroundStyle(Color.appTextOnPrimary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)

                Text(location.address)
                    .font(AppTextStyle.subheadlineBold.font)
                    .foregroundStyle(Color.appTextOnPrimary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)

                Text(location.idealTemperature)
                    .font(AppTextStyle.caption2.font)
                    .foregroundStyle(Color.appTextOnPrimary.opacity(0.82))
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
            }
            .padding(.leading, 25)
            .padding(.top, 30)
            .padding(.bottom, 24)
            .frame(width: width, height: height, alignment: .leading)
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var fallbackGradient: LinearGradient {
        LinearGradient(
            colors: [.blue.opacity(0.75), .cyan.opacity(0.55), .green.opacity(0.35)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

struct LocationCardData: Identifiable {
    let id = UUID()
    let temperature: String
    let title: String
    let address: String
    let idealTemperature: String
}

#Preview {
    LocationCardView(
        location: LocationCardData(
            temperature: "26°C",
            title: "Prabowo Tandur",
            address: "Tanah Abang, Jakarta",
            idealTemperature: "Ideal: 20°C - 30°C"
        )
    )
    .padding()
}
