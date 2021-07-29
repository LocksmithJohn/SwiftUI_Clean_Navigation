//
//  ProjectsScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import SwiftUI

struct ProjectsScreen: View {
    @EnvironmentObject var viewStack: ViewStack
    var body: some View {
            VStack {
                ScrollView {
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()
                    Text("ProjectsScreen").padding()

                Text("ProjectsScreen")
                Button(action: { viewStack.send(.pop) },
                       label: { Text("go back") } )
                }
            }
        .modifier(NavigationModifier(
            title: "Projekty",
            leftButtonImage: Image(systemName: "arrowshape.turn.up.left"),
            leftButtonAction: { viewStack.send(.pop) },
            rightButtonImage: Image(systemName: "arrow.clockwise.heart"),
            rightButtonAction: { viewStack.send(.push(.tasks)) })
        )
    }
}

