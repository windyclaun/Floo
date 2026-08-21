//
//  ContentView.swift
//  Floo
//
//  Created by Windy Claudia Napitupulu on 21/08/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Ini sudah plus jakarta")
                .font(.appTitle)
                .foregroundStyle(Color("AppAccent"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
