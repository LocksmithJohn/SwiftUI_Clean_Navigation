//
//  ViewStack.swift
//  Trening_CleanArchitecture
//
//  Created by User on 22/07/2021.
//

import Foundation

class ViewStack: ObservableObject {
    @Published private (set) var screens: [ScreenType] = [] {
        didSet {
            print("filter   ----ViewStack----")
            screens.forEach {
                print("filter   |screen: \($0)")
            }
            print("filter   -----------------")
        }
    }
    
    func send(_ action: StackAction) {
        switch action {
//        case .set(let array):
//            <#code#>
        case .push(let screenType):
            guard !screens.contains(screenType) else { return }
            screens.append(screenType)
        case .pop:
            guard !screens.isEmpty else { return }
            screens.removeLast()
        }
    }
}

//protocol StackScreenProtocol {
//    var uuid: UUID { get }
//    var title: String { get }
//}

