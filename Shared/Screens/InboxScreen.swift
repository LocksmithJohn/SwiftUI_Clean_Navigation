//
//  InboxScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 29/07/2021.
//

import SwiftUI

struct InboxScreen: MyView {
    var type = SType.inbox
    
    @EnvironmentObject var router: Router
    @Environment(\.injected) private var injected: Container
    
    var body: some View {
        VStack {
            Button {
                router.route(from: type)
            } label: {
                Text("Dismiss")
            }.buttonStyle(CustomButtonStyle())
        }
        .modifier(NavigationBarModifier(
            title: "Inbox",
            rightButtonImage: Image(systemName: "arrow.clockwise.heart"),
            rightButtonAction: { router.route(from: type) })
        )
        .onDisappear {
            router.hideModal()
        }
    }
}
