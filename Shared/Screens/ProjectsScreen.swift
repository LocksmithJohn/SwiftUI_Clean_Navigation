//
//  ProjectsScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import Combine
import SwiftUI

struct ProjectsScreen: MyView {
    var type = SType.projects
    
    @Environment(\.injected) private var injected: Container
    @EnvironmentObject var router: Router
    
    @State var projectsNames = [String]()
    
    var body: some View {
        VStack {
            List {
                ForEach(projectsNames, id: \.self) { task in
                    Text(task)
                }
            }
            Button(action: { injected.projectsInteractor.add(project: Project(name: "project", description: "project desc", tasks: [Task(name: "task in project", subtitle: "", parentProject: "")]) ) },
                   label: { Text("Add project") } )
                .buttonStyle(CustomButtonStyle(color: .green))
            Button(action: { router.route(from: type) },
                   label: { Text("Project details") } )
                .buttonStyle(CustomButtonStyle())
                .padding(.bottom, 16)
        }
        .modifier(NavigationBarModifier(type.title))
        .onReceive(projectsPublisher) { projectsNames = $0.map { $0.name ?? "-" } }
    }
    
    private var projectsPublisher: AnyPublisher<[Project], Never> {
        injected.appState.projectsSubject
            .eraseToAnyPublisher()
    }
}

