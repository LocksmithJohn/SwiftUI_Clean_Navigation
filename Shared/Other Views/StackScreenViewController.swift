//
//  StackScreenViewController.swift
//  Trening_CleanArchitecture
//
//  Created by User on 22/07/2021.
//

import Foundation
import SwiftUI

class StackScreenViewController: UIHostingController<AnyView> {
    var viewStack: ViewStack
    var type: ScreenType { didSet {
        rootView = screenFactory(type: type, viewStack: viewStack)
    } }

    init(viewStack: ViewStack, type: ScreenType) {
        self.viewStack = viewStack
        self.type = type
        super.init(rootView: screenFactory(type: type, viewStack: viewStack))
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.title = type.title
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
}

func screenFactory(type: ScreenType, viewStack: ViewStack) -> AnyView {
    switch type {
    case .tasks:
        return AnyView(TasksScreen().environmentObject(viewStack))
    case .projects:
        return AnyView(ProjectsScreen().environmentObject(viewStack))
    }
}

enum ScreenType {
    case tasks
    case projects
    
    var title: String {
        switch self {
        case .tasks:
            return "Zadania"
        case .projects:
            return "Projekty"
        }
    }
}


