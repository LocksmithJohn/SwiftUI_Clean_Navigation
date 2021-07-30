//
//  InboxScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 29/07/2021.
//

import SwiftUI

struct InboxScreen: View {
    @EnvironmentObject var viewStack: ViewStack
    @Environment(\.injected) private var injected: Container
    
    var body: some View {
        VStack {
            Button { viewStack.send(.dismiss) } label: {
                Text("Dismiss")
            }.buttonStyle(CustomButtonStyle())
        }
        .modifier(NavigationBarModifier(
            title: "Inbox",
            rightButtonImage: Image(systemName: "arrow.clockwise.heart"),
            rightButtonAction: { viewStack.send(.push(.projects)) })
        )
        .onDisappear {
            viewStack.send(.dismiss)
        }
    }
}
