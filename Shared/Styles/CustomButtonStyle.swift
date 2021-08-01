//
//  CustomButtonStyle.swift
//  Trening_CleanArchitecture
//
//  Created by User on 25/07/2021.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var color: Color = .blue
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
