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
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.isHidden = true
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.navigationBar.barTintColor = .red
        navigationController.navigationBar.tintColor = .green
        navigationController.navigationBar.backgroundColor = .orange

        return navigationController
    }
    
    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {
        let presentedViewControllers = navigationController.viewControllers
        let newViewControllers = viewStack.screens.map { screenType -> UIViewController in
            let viewController = presentedViewControllers.first {
                $0.title == screenType.title
            }
            print("filter viewController.first: \(viewController)")
            let newVC = StackScreenViewController(viewStack: viewStack, type: screenType)
            print("filter newVC: \(newVC)")

            return viewController ?? newVC// tutaj powininen wjechac viewStack jako parametr
        }
        print("filter viewStack.screens: \(viewStack.screens.map { $0.title })")
        print("filter newViewControllers: \(newViewControllers.map { $0.title })")
//        let animate = !navigationController.viewControllers.isEmpty///
        print("filter vcs: \(navigationController.viewControllers.map { $0.title })")
        navigationController.setViewControllers(newViewControllers, animated: true)
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.isHidden = true
        
        navigationController.navigationBar.tintColor = .yellow
        navigationController.navigationBar.backgroundColor = .purple
        navigationController.setNavigationBarHidden(true, animated: false)

    }
    
    
    func makeCoordinator() -> NavigationStackCoordinator {
        NavigationStackCoordinator()//view: self)
    }
}

final class NavigationStackCoordinator: NSObject, UINavigationControllerDelegate {
}
