//
//  ContentView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 17/6/24.
//

import SwiftUI
import Foundation
struct ContentView: View {
    @State var viewModel:ViewModel
    @State var currentDayWeather:CurrentDayWeather
    @State var weatherHourlyArray:[CurrentDayWeather] = []
    @State var weatherDailyArray:[WeatherDay] = []
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                ConditionWeather(currentWeather:$currentDayWeather)
                StatusWeather(currentDayWeather:$currentDayWeather)
                ArrowsView(weatherDailyArray: $weatherDailyArray)
                BottomChartView(weatherHourlyArray: $weatherHourlyArray)
                BottomButton()
           
            }.frame(height:UIDevice.current.userInterfaceIdiom == .pad ?  1290 : 900)
            .task{
                currentDayWeather = await viewModel.getCurrentHourlyWeather()
                weatherHourlyArray = await viewModel.getHourlyArrayWeather()
                weatherDailyArray = await viewModel.getDailyArrayWeather()
            }
                
        }
        
    }
}
