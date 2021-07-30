//
//  ContentView.swift
//  Shared
//
//  Created by User on 18/07/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let container: Container
    var body: some View {
        TabView {
            InboxNavigationController()
                .environmentObject(container.viewStackInbox)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Inbox")
                }.tag(1)
            TasksNavigationController()
                .environmentObject(container.viewStackTasks)
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Tasks")
                }.tag(2)
            ProjectsNavigationController()
                .environmentObject(container.viewStackProjects)
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Projects")
                }.tag(1)
        }
    }
}
