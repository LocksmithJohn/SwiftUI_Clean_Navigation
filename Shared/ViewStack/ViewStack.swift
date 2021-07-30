//
//  ViewStack.swift
//  Trening_CleanArchitecture
//
//  Created by User on 22/07/2021.
//

import Foundation

class ViewStack: ObservableObject {
    
    @Published private (set) var screens: [Screen] = [] {
        didSet { printStactInfo() }
    }
    
    func send(_ action: StackAction) {
        switch action {
        case .set(let types):
            screens.removeAll()
            addScreens(types)
        case .push(let type):
            guard !exists(type) else { return }
            addScreen(type)
        case .pushExisting(let type):
            screens.removeAll { type == $0.type }
            addScreen(type)
        case .present(let type):
            let screen = Screen(type: type)
            screen.isModal = true
            screens.append(screen)
        case .dismiss:
            objectWillChange.send()
            screens.removeAll { $0.isModal }
            printStactInfo()
        case .pop:
            guard !screens.isEmpty else { return }
            screens.removeLast()
        }
    }
    
    private func addScreens(_ types: [SType]) {
        types.forEach {
            addScreen($0)
        }
    }
    
    private func addScreen(_ type: SType) {
        screens.append(Screen(type: type))
    }
    
    private func removeScreen(_ type: SType) {
        screens.removeAll { $0.type == type }
    }
    
    private func exists(_ type: SType) -> Bool {
        screens.contains(where: { $0.type == type})
    }
    
    private func printStactInfo() {
        print("filter   ----ViewStack----")
        screens.reversed().forEach {
            print("filter   |screen: \($0.type.title) \($0.isModal ? "is Modal" : "")")
        }
        print("filter   -----------------")
    }
    
}
