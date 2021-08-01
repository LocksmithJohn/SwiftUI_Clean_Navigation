//
//  TasksScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import Combine
import SwiftUI

protocol MyView: View {
    var type: SType { get set }
}

struct TasksScreen: MyView {
    
    var type = SType.tasks
    
    @EnvironmentObject var router: Router
    @Environment(\.injected) private var injected: Container
    
    @State private var tasksNames: [String] = []
    @State private var newTask: String = ""
    
    private var bag = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            List {
                ForEach(tasksNames, id: \.self) { task in
                    Text(task)
                }

            }
            TextField("new task", text: $newTask)
                .textFieldStyle(CustomTextfielsStyle())
            Button {
                let task = Task(name: newTask, subtitle: "subtitle", parentProject: "nil")
                injected.taskInteractor.add(task: task)
            } label: {
                Text("Add Task")
            }.buttonStyle(CustomButtonStyle(color: .green))
            Button { router.route(from: type) } label: {
                Text("Next")
            }
            .buttonStyle(CustomButtonStyle())
            .padding(.bottom, 16)
        }
        .modifier(NavigationBarModifier(type.title))
        .onReceive(tasksPublisher, perform: { tasksNames = $0.map { $0.name ?? "-" } } )
    }
    
    private var tasksPublisher: AnyPublisher<[Task], Never> {
        injected.appState.tasksSubject
            .eraseToAnyPublisher()
    }
    
}

