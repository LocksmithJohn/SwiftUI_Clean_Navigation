//
//  DIContainer.swift
//  Trening_CleanArchitecture
//
//  Created by User on 18/07/2021.
//

import Combine
import SwiftUI

struct DIContainer: EnvironmentKey {
    let appState = AppState()
    let taskInteractor: TaskInteractor
    let viewStack = ViewStack()

    private var anyCancellable = Set<AnyCancellable>()
    
    static var defaultValue: Self {
        Self()
    }

    init() {
        self.taskInteractor = TaskInteractor(appstate: appState)
    }
    
}

extension CurrentValueSubject {
    func updates<Value>(for keyPath: KeyPath<Output, Value>) ->
        AnyPublisher<Value, Failure> where Value: Equatable {
        return map(keyPath).removeDuplicates().eraseToAnyPublisher()
    }
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { container }
        set {}
    }
}

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
