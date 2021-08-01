//
//  CustomTextfielsStyle.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import SwiftUI

struct CustomTextfielsStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: 300)
            .padding()
            .foregroundColor(.black)
            .cornerRadius(10)
            .font(.system(size: 30))
    }
    
}
