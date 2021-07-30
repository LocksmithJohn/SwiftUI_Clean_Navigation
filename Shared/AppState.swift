//
//  AppState.swift
//  Trening_CleanArchitecture
//
//  Created by User on 18/07/2021.
//

import Combine
import Foundation

struct AppState {
    
    var tasksSubject: CurrentValueSubject<[Task], Never> = CurrentValueSubject([])
    var projects = [Project]()
    var tasks: [Task] = [] { didSet { tasksSubject.send(tasks) }}
    
}
