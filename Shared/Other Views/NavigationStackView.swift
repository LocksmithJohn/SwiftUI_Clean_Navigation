//
//  NavigationStackView.swift
//  Trening_CleanArchitecture
//
//  Created by User on 21/07/2021.
//

import Foundation
import SwiftUI

struct NavigationStackView: UIViewControllerRepresentable {
    @EnvironmentObject var viewStack: ViewStack
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.delegate = context.coordinator

        return navigationController
    }
    
    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {
        let presentedViewControllers = navigationController.viewControllers
        let newViewControllers = viewStack.screens
            .filter { !$0.isModal }
            .map { screen -> UIViewController in
            let viewController = presentedViewControllers.first {
                $0.title == screen.type.title
            }
            let newVC = StackScreenViewController(viewStack: viewStack, type: screen.type)
            return viewController ?? newVC
        }
        
        navigationController.setViewControllers(newViewControllers, animated: true)
        
        if let screen = viewStack.screens.first(where: { $0.isModal }) {
            let modalVC = StackScreenViewController(viewStack: viewStack, type: screen.type)
            navigationController.viewControllers.last?.present(modalVC, animated: true)
        } else {
            navigationController.viewControllers.forEach { $0.dismiss(animated: true) }
        }
        
    }
    
    
    func makeCoordinator() -> NavigationStackCoordinator {
        NavigationStackCoordinator()//view: self)
    }
 
}

final class NavigationStackCoordinator: NSObject, UINavigationControllerDelegate {
}
