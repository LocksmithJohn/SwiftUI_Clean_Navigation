//
//  TaskInteractor.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import Foundation

protocol TasksInteractorProtocol {
    func add(task: Task)
}

class TasksInteractor: TasksInteractorProtocol {
    
    var appState: AppState
    
    init(appstate: AppState) {
        self.appState = appstate
    }
    
    func add(task: Task) {
        appState.addTask(task)
    }
    
}
