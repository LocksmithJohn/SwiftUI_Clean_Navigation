//
//  ProjectsScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import SwiftUI

struct ProjectsScreen: View {
    @Environment(\.injected) private var injected: Container
    @EnvironmentObject var viewStack: ViewStack
    var body: some View {
        VStack {
            Button(action: { viewStack.send(.pop) },
                   label: { Text("go back") } )
                .buttonStyle(CustomButtonStyle())
            Button(action: { viewStack.send(.present(.inbox)) },
                   label: { Text("Go to Inbox Modal") } )
                .buttonStyle(CustomButtonStyle())
        }
        .modifier(NavigationBarModifier(
            title: "Projekty",
            leftButtonImage: Image(systemName: "arrowshape.turn.up.left"),
            leftButtonAction: { viewStack.send(.pop) },
            rightButtonImage: Image(systemName: "arrow.clockwise.heart"),
            rightButtonAction: { viewStack.send(.push(.tasks)) })
        )
    }
}

