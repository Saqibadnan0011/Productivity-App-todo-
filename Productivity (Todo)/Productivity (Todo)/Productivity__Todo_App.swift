//
//  Productivity__Todo_App.swift
//  Productivity (Todo)
//
//  Created by apple on 05/07/2023.
//

import SwiftUI

@main
struct Productivity__Todo_App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                AuthView()
            }
            .environmentObject(listViewModel)
        }
    }
}
