//
//  Helper.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
struct  Helper{
    var isoDateFormatter:ISO8601DateFormatter
    private init(isoDateFormatter: ISO8601DateFormatter) {
        self.isoDateFormatter = isoDateFormatter
    }
    
    init() {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]
        self.init(isoDateFormatter: isoDateFormatter)
    }
}
extension Helper{
    func convertISODate(date:String,dateFormat:String)->String{
        guard let realDate = isoDateFormatter.date(from: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from:realDate)
    }
    func convertISOTime(date:String,dateFormat:String)->String{
        guard let realDate = isoDateFormatter.date(from: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from:realDate)
    }
    func convertISODateFullDate(date:String,dateFormat:String)->String{
        guard let realDate = isoDateFormatter.date(from: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from:realDate)
    }
    func createIcon(condition:String)->String{
        var imageName = String()
        if condition == "Sunny"{
            imageName = "sun.max.fill"
        } else if condition == "Rainy"{
            imageName = "cloud.rain.fill"
        } else if condition == "Cloudy"{
            imageName = "cloud.fill"
        } else if condition == "Snowy"{
            imageName = "cloud.snow.fill"
        }
        return imageName
    }

}
