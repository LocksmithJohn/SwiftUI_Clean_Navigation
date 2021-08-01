//
//  Models.swift
//  Trening_CleanArchitecture
//
//  Created by User on 19/07/2021.
//

import Foundation

struct Project: Equatable {
    var name: String? = nil
    var description: String? = nil
    var tasks: [Task]
}

struct Task: Equatable {
    var name: String? = nil
    var subtitle: String = ""
    var parentProject: String = ""
}
