//
//  ContentView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 17/6/24.
//

import SwiftUI
import Foundation
struct ContentView: View {
    @State var fetchWeather = FetchWeatherData()
    @State var currentHourlyWeather:CurrentDayWeather
    @State var currentDayWeather:CurrentDayWeather
    @State var weatherDailyArray:[WeatherDay] = []
    @State var weatherHourlyArray:[CurrentDayWeather] = []
    let helper = Helper()
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                ConditionWeather(currentWeather: $currentHourlyWeather)
                StatusWeather(currentDayWeather: $currentDayWeather)
                ArrowsView()
                BottomChartView(weatherHourlyArray: $weatherHourlyArray)
                BottomButton()
           
            }.frame(height:UIDevice.current.userInterfaceIdiom == .pad ?  1290 : 900)
                .task{
                    let fetchHourlyArray = await fetchWeather.fetchWeatherDataHourly(endpoint: "/hourly")
                    for item in fetchHourlyArray{
                        weatherHourlyArray.append(CurrentDayWeather(time: helper.convertISOTime(date: item.date), dayOfWeek: helper.convertISODateFullDate(date:item.date), imageName: helper.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                        
                    }
                    guard let fetchCurrentWeather = weatherHourlyArray.first else {
                        return
                    }
                    currentHourlyWeather = fetchCurrentWeather
                    let fetchDailyArray = await fetchWeather.fetchWeatherDataDaily(endpoint: "/daily")
                    for item in fetchDailyArray{
                        weatherHourlyArray.append(CurrentDayWeather(time: helper.convertISOTime(date: item.date), dayOfWeek: helper.convertISODateFullDate(date:item.date), imageName:  helper.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                        
                    }
                    guard let fetchCurrentWeather = weatherHourlyArray.first else {
                        return
                    }
                    currentDayWeather = fetchCurrentWeather
                }
        }
        
    }
}
