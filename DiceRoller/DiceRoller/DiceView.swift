//
//  DiceView.swift
//  DiceRoller
//
//  Created by Jonathan McDaniel on 7/8/24.
//

import SwiftUI

struct DiceView: View {
    
    @State private var numberofPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberofPips).fill" )
            .resizable()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 100)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.black, .white)
            .onTapGesture {
                withAnimation {
                    numberofPips = Int.random(in: 1...6)
                }
            }
        }
    }
}

#Preview {
    DiceView().background(.appBackground)
}
