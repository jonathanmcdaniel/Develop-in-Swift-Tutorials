//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Jonathan McDaniel on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hey guys!")
                .padding()
                .background(Color.mint, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 10)
            Text("test")
                .padding()
                .background(Color.cyan, in: RoundedRectangle(cornerRadius: 8))
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
