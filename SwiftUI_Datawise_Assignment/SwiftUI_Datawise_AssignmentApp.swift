//
//  SwiftUI_Datawise_AssignmentApp.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 17/6/24.
//

import SwiftUI

@main
struct SwiftUI_Datawise_AssignmentApp: App {
    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
              
        }
    }
}
