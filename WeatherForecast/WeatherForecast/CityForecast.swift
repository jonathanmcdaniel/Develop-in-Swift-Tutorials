//
//  CityForecast.swift
//  WeatherForecast
//
//  Created by Jonathan McDaniel on 7/7/24.
//

import SwiftUI

struct CityForecast: View {
    let cityName: String
    let forecast: String
    let high: Int
    let low: Int
    
    func iconName(f: String) -> String {
        switch f {
        case "Sunny":
            return "sun.max.fill"
            
        case "Rainy":
            return "cloud.rain.fill"
            
        case "Cloudy":
            return "cloud.fill"
            
        default:
            return "sun.max.fill"
        }
    }
    
    var body: some View {
        VStack {
            Text(cityName)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            Image(systemName: iconName(f: forecast))
                .font(.system(size: 70))

        }
    }
}

#Preview {
    CityForecast(cityName: "Philadelphia", forecast: "Sunny", high: 90, low: 75)
}
