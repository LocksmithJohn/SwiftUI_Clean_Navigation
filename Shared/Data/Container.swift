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
    let taskInteractor: TaskInteractor
    let viewStackInbox = ViewStack()
    let viewStackTasks = ViewStack()
    let viewStackProjects = ViewStack()
    
    static var defaultValue: Self {
        Self()
    }

    init() {
        self.taskInteractor = TaskInteractor(appstate: appState)
    }
    
}
