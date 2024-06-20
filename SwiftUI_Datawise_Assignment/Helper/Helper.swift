//
//  Helper.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
class Helper{
    static let shared = Helper()
    private init(){}
    func convertISODate(date:String)->String{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]

        guard let realDate = isoDateFormatter.date(from: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from:realDate)
    }
    func convertISOTime(date:String)->String{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]

        guard let realDate = isoDateFormatter.date(from: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        return dateFormatter.string(from:realDate)
    }
    func convertISODateFullDate(date:String)->String{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]

        guard let realDate = isoDateFormatter.date(from: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E dd MMMM yyyy"
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
