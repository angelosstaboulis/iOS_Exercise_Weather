//
//  ViewModel.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 5/7/24.
//

import Foundation
class ViewModel{
    func getCurrentHourlyWeather() async->CurrentDayWeather{
        let fetchWeather = FetchWeatherData()
        let fetchHourlyArray = await fetchWeather.fetchWeatherDataHourly(endpoint: "/hourly")
        let helper = Helper()
        var weatherHourlyArray:[CurrentDayWeather] = []
        for item in fetchHourlyArray{
            weatherHourlyArray.append(CurrentDayWeather(time: helper.convertISOTime(date: item.date), dayOfWeek: helper.convertISODateFullDate(date:item.date), imageName: helper.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
            
        }
        guard let fetchCurrentWeather = weatherHourlyArray.first else {
            return .init(time: "", dayOfWeek: "", imageName: "", condition: "", temperature: 0)
        }
        let currentHourlyWeather = fetchCurrentWeather
        return currentHourlyWeather
    }
    func getHourlyArrayWeather() async->[CurrentDayWeather]{
        return await withCheckedContinuation { continuation in
            Task{
                let fetchWeather = FetchWeatherData()
                let fetchHourlyArray = await fetchWeather.fetchWeatherDataHourly(endpoint: "/hourly")
                let helper = Helper()
                var weatherHourlyArray:[CurrentDayWeather] = []
                for item in fetchHourlyArray{
                    weatherHourlyArray.append(CurrentDayWeather(time: helper.convertISOTime(date: item.date), dayOfWeek: helper.convertISODateFullDate(date:item.date), imageName: helper.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                    
                }
                continuation.resume(returning: weatherHourlyArray)
            }
        }
    }
    func getDailyArrayWeather() async->[WeatherDay]{
        return await withCheckedContinuation { continuation in
            Task{
                let fetchWeather = FetchWeatherData()
                let fetchDailyArray = await fetchWeather.fetchWeatherDataDaily(endpoint: "/daily")
                let helper = Helper()
                var weatherDailyArray:[WeatherDay] = []
                for item in fetchDailyArray{
                    weatherDailyArray.append(WeatherDay(dayOfWeek: helper.convertISODate(date: item.date), imageName: helper.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                }
                continuation.resume(returning: weatherDailyArray)
            }
        }
        
        
    }
}
