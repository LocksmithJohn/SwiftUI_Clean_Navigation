//
//  Trening_CleanArchitectureApp.swift
//  Shared
//
//  Created by User on 18/07/2021.
//
import Combine
import SwiftUI

let container = Container()

@main
struct Trening_CleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(container: container)
                .ignoresSafeArea()
        }
    }
}
