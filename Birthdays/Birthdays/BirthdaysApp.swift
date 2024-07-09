//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Jonathan McDaniel on 7/8/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
