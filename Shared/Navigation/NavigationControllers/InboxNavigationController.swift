//
//  InboxNavigationController.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import SwiftUI

struct InboxNavigationController: NavigationController {
    
    @EnvironmentObject var viewStack: ViewStack

    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {
        snapShotStackView(navigationController: navigationController, viewStack: viewStack)
    }
    
    func setInitialView() {
        viewStack.send(.set([.inbox]))
    }
 
}
