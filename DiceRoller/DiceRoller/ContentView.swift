//
//  ContentView.swift
//  DiceRoller
//
//  Created by Jonathan McDaniel on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 3

    var body: some View {
        
        VStack {
            Text("DiceRoller")
                .font(.largeTitle.lowercaseSmallCaps().bold())
                .foregroundStyle(.white)
            
            HStack{
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                .symbolRenderingMode(.multicolor)

                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    numberOfDice += 1
                }
                .symbolRenderingMode(.multicolor)
                
                .disabled(numberOfDice == 10)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
