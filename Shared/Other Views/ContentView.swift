//
//  ContentView.swift
//  Shared
//
//  Created by User on 18/07/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let container: DIContainer
    var body: some View {
        
        NavigationStackView()
            .environmentObject(container.viewStack)
            .onAppear {
                container.viewStack.send(.push(.tasks))
            }
    }
}
