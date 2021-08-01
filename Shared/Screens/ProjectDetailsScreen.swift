//
//  ProjectDetailsScreen.swift
//  Trening_CleanArchitecture
//
//  Created by User on 01/08/2021.
//

import SwiftUI

struct ProjectDetailsScreen: MyView {
    
    @EnvironmentObject var router: Router
    
    var type = SType.projectDetails
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.modifier(NavigationBarModifier(type.title,
                                         leftButtonImage: Image(systemName: "arrowshape.turn.up.backward"),
                                         leftButtonAction: { router.pop() }))
    }
}

struct ProjectDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailsScreen()
    }
}
