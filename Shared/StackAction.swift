//
//  StackAction.swift
//  Trening_CleanArchitecture
//
//  Created by User on 20/07/2021.
//

import Foundation
import UIKit

enum StackAction {
//  case set([ScreenType])
  case push(ScreenType)
  case pop
//  case popToRoot
  // stack item actions:
//  case root(UUID, RootAction)
//  case counter(UUID, CounterAction)
}

