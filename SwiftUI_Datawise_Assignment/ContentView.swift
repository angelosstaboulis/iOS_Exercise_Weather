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
    @State var currentWeather:CurrentDayWeather
    @State var weatherDailyArray:[WeatherDay] = []
    @State var weatherHourlyArray:[CurrentDayWeather] = []
    @State var counter:Int
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                HStack{
                    ConditionTextView(condition: $currentWeather)
                }.frame(width:400,height:230,alignment: .top)
                VStack{
                    
                    WeatherStatusView(currentDayWeather: $currentWeather).task{
                            await fetchWeather.fetchWeatherDataHourly(endpoint: "/hourly") { arrayHourly in
                                for item in arrayHourly{
                                    weatherHourlyArray.append(CurrentDayWeather(time: Helper.shared.convertISOTime(date: item.date), dayOfWeek: Helper.shared.convertISODateFullDate(date:item.date), imageName:  Helper.shared.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                                  
                                }
                                guard let fetchCurrentDayWeather = arrayHourly.first else{
                                    return
                                }
                                currentWeather = CurrentDayWeather(time: Helper.shared.convertISOTime(date: fetchCurrentDayWeather.date), dayOfWeek: Helper.shared.convertISODateFullDate(date:fetchCurrentDayWeather.date), imageName:  Helper.shared.createIcon(condition: fetchCurrentDayWeather.condition), condition: fetchCurrentDayWeather.condition, temperature: fetchCurrentDayWeather.temperature)
                            }
                    }
                }.frame(width:300,height:230)
                 
             
                ScrollViewReader{proxy in
                    ScrollView(.horizontal){
                        HStack(spacing: 80){
                            ForEach(weatherDailyArray,id:\.self){item in
                                WeatherDayView(dayOfWeek: item.dayOfWeek, imageName: item.imageName, temperature:item.temperature)
                            }
                        }.task{
                            await fetchWeather.fetchWeatherDataHourly(endpoint: "/daily") { arrayDaily in
                                for item in arrayDaily{
                                    weatherDailyArray.append(WeatherDay(dayOfWeek: Helper.shared.convertISODate(date:item.date), imageName:  Helper.shared.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                                  
                                }
                            }
                        }
                        Spacer()
                    }
                }
                ScrollView(.horizontal){
                    VStack{
                        ChartView(weatherHourlyArray: $weatherHourlyArray)
                            .frame(width:UIDevice.current.userInterfaceIdiom == .pad ?  900 : 600)
                    }.frame(height:150)
                }
                Button {
                    
                } label: {
                    WeatherButton(title: "5-day forecast", textColor: .white, backColor: .orange)
                }.frame(height:250)
                Spacer()
                Spacer()
                Spacer()
            }.frame(height:UIDevice.current.userInterfaceIdiom == .pad ?  1290 : 990)
        }
        
    }
}
#Preview {
    ContentView(currentWeather: .init(time: "", dayOfWeek: "", imageName: "", condition: "", temperature: 0), counter: 0)
}
