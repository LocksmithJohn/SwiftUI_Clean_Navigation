//
//  InboxNavigationController.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import SwiftUI

struct InboxNavigationController: NavigationController {
    
    @EnvironmentObject var router: Router

    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {
        snapShotStackView(navigationController: navigationController, router: router)
    }
    
    func setInitialView() {
        router.setInitial(.inbox)
    }
 
}
