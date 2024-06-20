//
//  Model.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
class Model:Decodable,Identifiable{
    let date:String
    let temperature:Int
    let realFeel:Int
    let uvIndex:Int
    let chanceOfRain:Int
    let windSpeed:Int
    let condition:String
    enum CodingKeys: String, CodingKey {
      case date = "date"
      case temperature = "temperature"
      case realFeel = "realFeel"
      case uvIndex = "uvIndex"
      case chanceOfRain = "chanceOfRain"
      case windSpeed = "windSpeed"
      case condition = "condition"
    }
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.temperature = try container.decode(Int.self, forKey: .temperature)
        self.realFeel = try container.decode(Int.self, forKey: .realFeel)
        self.uvIndex = try container.decode(Int.self, forKey: .uvIndex)
        self.chanceOfRain = try container.decode(Int.self, forKey: .chanceOfRain)
        self.windSpeed = try container.decode(Int.self, forKey: .windSpeed)
        self.condition = try container.decode(String.self, forKey: .condition)
       
    }
}
