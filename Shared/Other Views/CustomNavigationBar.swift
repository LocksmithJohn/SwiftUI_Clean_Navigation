//
//  CustomNavigationBar.swift
//  Trening_CleanArchitecture
//
//  Created by User on 24/07/2021.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    private enum Constants {
        static let height: CGFloat = 50
    }
    
    let title: String?
    let leftButtonImage: Image?
    let leftButtonAction: (() -> Void)?
    let rightButtonImage: Image?
    let rightButtonAction: (() -> Void)?
    
    var body: some View {
        ZStack {
            if let title = title {
                Text(title).padding()
            }
            HStack {
                if let leftButtonImage = leftButtonImage {
                    Button(action: { leftButtonAction?() },
                           label: { leftButtonImage })
                        .padding()
                }
                Spacer()
                if let rightButtonImage = rightButtonImage {
                    Button(action: { leftButtonAction?() },
                           label: { rightButtonImage })
                        .padding()
                }
            }
        }

        .frame(height: Constants.height)
    }
}


struct NavigationModifier: ViewModifier {
    
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
            CustomNavigationBar(title: title,
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
