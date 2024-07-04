//
//  SwiftUI_Datawise_AssignmentApp.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 17/6/24.
//

import SwiftUI

@main
struct SwiftUI_Datawise_AssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currentHourlyWeather: .init(time: "", dayOfWeek: "", imageName: "", condition: "", temperature: 0), currentDayWeather: .init(time: "", dayOfWeek: "", imageName: "", condition: "", temperature: 0))
        }
    }
}
