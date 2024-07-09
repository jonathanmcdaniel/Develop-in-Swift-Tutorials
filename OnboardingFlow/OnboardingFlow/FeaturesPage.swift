//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by Jonathan McDaniel on 7/7/24.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack (spacing: 30){
            Text("Features")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "sun.max.fill", description: "this is a test to see how it loads a custom view from another file and it works really well")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
            
            Spacer()

        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}
