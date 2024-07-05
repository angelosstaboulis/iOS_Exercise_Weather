//
//  Model.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
struct Model:Codable{
    let date:String
    let temperature:Int
    let realFeel:Int
    let uvIndex:Int
    let chanceOfRain:Int
    let windSpeed:Int
    let condition:String
}
