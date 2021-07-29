//
//  ContentView.swift
//  Shared
//
//  Created by User on 18/07/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let viewStack = ViewStack()
    var body: some View {
        
        NavigationStackView()
            .environmentObject(viewStack)
            .onAppear {
                viewStack.send(.push(.tasks))
            }
    }
}
