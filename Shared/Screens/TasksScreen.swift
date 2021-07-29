//
//  TasksScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import SwiftUI

struct TasksScreen: View {
    @EnvironmentObject var viewStack: ViewStack
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    viewStack.send(.push(.projects))
                }
            label: {
                Spacer()
                Text("Action 1")
                Spacer()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
                Button { print("") }
            label: {
                Spacer()
                Text("Action 2")
                Spacer()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
                
            }
            .font(.headline)
            .padding()
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
        }
        .modifier(NavigationModifier(
            title: "Taski",
            rightButtonImage: Image(systemName: "arrow.clockwise.heart"),
            rightButtonAction: { viewStack.send(.push(.projects)) })
        )

    }
}

