//
//  planner_for_meApp.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import SwiftUI
import FirebaseCore

@main
struct planner_for_meApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
