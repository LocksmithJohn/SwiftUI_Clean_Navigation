//
//  DIContainer.swift
//  Trening_CleanArchitecture
//
//  Created by User on 18/07/2021.
//

import Combine
import SwiftUI

struct Container: EnvironmentKey {
    
    let appState = AppState()
    
    let taskInteractor: TasksInteractor
    let projectsInteractor: ProjectsInteractor

    let routerInbox = Router()
    let routerTasks = Router()
    let routerProjects = Router()
    
    static var defaultValue: Self {
        Self()
    }

    init() {
        self.taskInteractor = TasksInteractor(appstate: appState)
        self.projectsInteractor = ProjectsInteractor(appstate: appState)
    }
    
}
