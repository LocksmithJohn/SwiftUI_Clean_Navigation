//
//  TaskInteractor.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import Foundation

protocol TaskInteractorProtocol {
    func add(task: Task)
}

class TaskInteractor: TaskInteractorProtocol {
    
    var appState: AppState
    
    init(appstate: AppState) {
        self.appState = appstate
    }
    
    func add(task: Task) {
        appState.tasks.append(task)
    }
    
}
