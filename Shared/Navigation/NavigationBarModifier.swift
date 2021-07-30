//
//  NavigationBarModifier.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    
    let title: String?
    let leftButtonImage: Image?
    let leftButtonAction: (() -> Void)?
    let rightButtonImage: Image?
    let rightButtonAction: (() -> Void)?
    
    init(title: String? = nil,
         leftButtonImage: Image? = nil,
         leftButtonAction: (() -> Void)? = nil,
         rightButtonImage: Image? = nil,
         rightButtonAction: (() -> Void)? = nil) {
        self.title = title
        self.leftButtonImage = leftButtonImage
        self.leftButtonAction = leftButtonAction
        self.rightButtonImage = rightButtonImage
        self.rightButtonAction = rightButtonAction
    }
    
    func body(content: Content) -> some View {
        VStack {
            NavigationBar(title: title,
                                leftButtonImage: leftButtonImage,
                                leftButtonAction: leftButtonAction,
                                rightButtonImage: rightButtonImage,
                                rightButtonAction: rightButtonAction)
            Spacer()
            content
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
    }
    
}
