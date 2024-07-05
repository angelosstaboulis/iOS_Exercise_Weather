//
//  CurrentDayWeather.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 19/6/24.
//

import Foundation
struct CurrentDayWeather:Identifiable,Hashable{
    let id = UUID()
    let time:String
    let dayOfWeek:String
    let imageName:String
    let condition:String
    let temperature:Int
    func hash(into hasher: inout Hasher) {
      
    }
}
