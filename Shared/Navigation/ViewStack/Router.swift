//
//  ViewStack.swift
//  Trening_CleanArchitecture
//
//  Created by User on 22/07/2021.
//

import Foundation

class Router: ObservableObject {
    
    @Published private (set) var screens: [Screen] = [] {
        didSet { printStactInfo() }
    }
        
    private func send(_ action: StackAction) {
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
        print("filter     ----Screens----")
        screens.reversed().forEach {
            print("filter     |screen: \($0.type.title) \($0.isModal ? "is Modal" : "")")
        }
        print("filter     -----------------")
    }
    
    
    func route(from type: SType?, strategy: Strategy = .first) {
        switch type {
        case .none where strategy == .first: // initial inbox
            send(.push(.inbox))
        case .none where strategy == .second: // initial tasks
            send(.push(.tasks))
        case .none where strategy == .third: // initial projects
            send(.push(.projects))
            
        case .inbox where strategy == .first:
            send(.push(.tasks))
        case .tasks where strategy == .first:
            send(.push(.projects))
        default: break
        }
    }
    
    func setInitial(_ type: SType) {
        send(.push(type))
    }
    
    func hideModal() {
        send(.dismiss)
    }
    
}
