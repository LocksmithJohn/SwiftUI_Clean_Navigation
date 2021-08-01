//
//  ProjectsInteractor.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import Foundation

protocol ProjectsInteractorProtocol {
    func add(project: Project)
}

class ProjectsInteractor : ProjectsInteractorProtocol {
    
    var appState: AppState
    
    init(appstate: AppState) {
        self.appState = appstate
    }
    
    func add(project: Project) {
        appState.addProject(project)
        addTasksFromProject(project: project)
    }
    
}

private extension ProjectsInteractor {
    
    func addTasksFromProject(project: Project) {
        project.tasks.forEach {
            appState.addTask($0)
        }
    }
    
}
