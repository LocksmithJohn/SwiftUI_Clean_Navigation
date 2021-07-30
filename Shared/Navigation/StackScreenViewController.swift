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
    var type: SType { didSet {
        rootView = ScreenFactory.make(type: type, viewStack: viewStack)
    } }

    init(viewStack: ViewStack, type: SType) {
        self.viewStack = viewStack
        self.type = type
        super.init(rootView: ScreenFactory.make(type: type, viewStack: viewStack))
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.title = type.title
    }
    
    required init?(coder aDecoder: NSCoder) { nil }
}

class Screen: Equatable {
    
    var isModal = false
    var type = SType.tasks
    
    init(type: SType) {
        self.type = type
    }
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.type == rhs.type
    }
    
}

enum SType {
    case tasks
    case projects
    case inbox
    
    var title: String {
        switch self {
        case .tasks:
            return "Zadania"
        case .projects:
            return "Projekty"
        case .inbox:
            return "Inbox"
        }
    }
}
