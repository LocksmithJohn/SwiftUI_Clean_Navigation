//
//  ScreenFactory.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import SwiftUI

struct ScreenFactory {
    
    static func make(type: SType, viewStack: ViewStack) -> AnyView {
        switch type {
        case .tasks:
            return AnyView(TasksScreen().environmentObject(viewStack))
        case .projects:
            return AnyView(ProjectsScreen().environmentObject(viewStack))
        case .inbox:
            return AnyView(InboxScreen().environmentObject(viewStack))
        }
    }
    
}
