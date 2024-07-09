//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jonathan McDaniel on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CityForecast(cityName: "Philadelphia", forecast: "Sunny", high: 90, low: 75)
            CityForecast(cityName: "Boston", forecast: "Rainy", high: 90, low: 75)
            CityForecast(cityName: "Austin", forecast: "Cloudy", high: 90, low: 75)
        }
        .tabViewStyle(.page)
        .background(.blue)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var iconSecondaryColor: Color {
        return Color.gray
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
                .shadow(radius: 2, x: 1, y: 1)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()

    }
}
