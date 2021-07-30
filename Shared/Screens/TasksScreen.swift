//
//  TasksScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import Combine
import SwiftUI

struct TasksScreen: View {
    
    @EnvironmentObject var viewStack: ViewStack
    @Environment(\.injected) private var injected: DIContainer
    @State var tasksNames: [String] = []
    
    private var bag = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            List {
                ForEach(tasksNames, id: \.self) { task in
                    Text(task)
                }
            }
            Button { viewStack.send(.push(.projects)) } label: {
                Text("Go to Projects")
            }.buttonStyle(CustomButtonStyle())
            Button {
                let task = Task(name: "nowy task", priority: 3)
                injected.taskInteractor.add(task: task)
            } label: {
                Text("Add Task")
            }.buttonStyle(CustomButtonStyle())
        }
        .font(.headline)
        .padding()
        .modifier(NavigationModifier(
            title: "Taski",
            rightButtonImage: Image(systemName: "arrow.clockwise.heart"),
            rightButtonAction: { viewStack.send(.push(.projects)) })
        )
        .onReceive(tasksPublisher, perform: { tasksNames = $0.map { $0.name ?? "-" } } )
    }
    
    private var tasksPublisher: AnyPublisher<[Task], Never> {
        injected.appState.tasksSubject.eraseToAnyPublisher()
    }
}

