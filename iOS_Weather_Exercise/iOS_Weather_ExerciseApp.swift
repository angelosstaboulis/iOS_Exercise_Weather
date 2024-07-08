//
//  iOS_Weather_ExerciseApp.swift
//  iOS_Weather_Exercise
//
//  Created by Angelos Staboulis on 8/7/24.
//

import SwiftUI

@main
struct iOS_Weather_ExerciseApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
