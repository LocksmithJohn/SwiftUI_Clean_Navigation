//
//  StackAction.swift
//  Trening_CleanArchitecture
//
//  Created by User on 20/07/2021.
//

import Foundation
import UIKit

enum StackAction {
    case push(SType)
    case pushExisting(SType)
    case pop
    case dismiss
    case present(SType)
    //  case popToRoot
}

