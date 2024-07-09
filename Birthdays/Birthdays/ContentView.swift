//
//  ContentView.swift
//  Birthdays
//
//  Created by Jonathan McDaniel on 7/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query (sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context

    
    @State var newName: String = ""
    @State var newBirthday: Date = Date.now
    
    var body: some View {
        NavigationStack { 
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
                .bold(friend.isBirthdayToday)
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save", action: {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                        
                        newName = ""
                        newBirthday = Date.now
                    })
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            .task {
                context.insert(Friend(name: "Elton Lin", birthday: .now))
                context.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)

}