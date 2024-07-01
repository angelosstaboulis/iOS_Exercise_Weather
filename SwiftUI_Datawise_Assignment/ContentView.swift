//
//  ContentView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 17/6/24.
//

import SwiftUI
import Foundation
enum Directions:Int{
    case Up = 0
    case Down = 1
    case None = 2
}
struct ContentView: View {
    @State var directions:Directions
    @State var fetchWeather = FetchWeatherData()
    @State var currentWeather:CurrentDayWeather
    @State var weatherDailyArray:[WeatherDay] = []
    @State var weatherHourlyArray:[CurrentDayWeather] = []
    @State private var selectedCell = 2
    @State private var newSelection = 0
    @State var getItem:[WeatherDay] = []
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
                ScrollViewReader { scrollViewProxy in
                    HStack{
                        Button(action: {
                            selectedCell = 1
                            newSelection = selectedCell
                        }, label: {
                            Image(systemName: "chevron.left.2")
                        })
                        Button(action: {
                            if newSelection == weatherDailyArray.count - 2{
                                newSelection =  0
                                selectedCell = newSelection
                            }else{
                                newSelection =  selectedCell + 1
                                selectedCell = newSelection
                            }
                        }, label: {
                            Image(systemName: "arrow.left")
                        })
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(weatherDailyArray.indices,id: \.self) { item in
                                    WeatherDayView(day: weatherDailyArray[item])
                                        .frame(width: 100, height: 150)
                                        .id(item)
                                }
                            }
                        }
                        Button(action: {
                            if newSelection == 1{
                                newSelection =  weatherDailyArray.count - 1
                                selectedCell = newSelection
                            }else{
                                newSelection =  selectedCell - 1
                                selectedCell = newSelection
                            }
                        }, label: {
                            Image(systemName: "arrow.right")
                        })
                        Button(action: {
                            selectedCell = weatherDailyArray.count - 1
                            newSelection = selectedCell
                        }, label: {
                            Image(systemName: "chevron.right.2")
                        })
                    }
                    .onChange(of: selectedCell) {
                        scrollViewProxy.scrollTo(selectedCell, anchor: .center)
                    }
                }.task{
                    await fetchWeather.fetchWeatherDataHourly(endpoint: "/daily") { arrayDaily in
                        for item in arrayDaily{
                            weatherDailyArray.append(WeatherDay(dayOfWeek: Helper.shared.convertISODate(date:item.date), imageName:  Helper.shared.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
                            
                        }
                    }
                }
                ScrollView(.horizontal){
                                   VStack{
                                       ChartView(weatherHourlyArray: $weatherHourlyArray)
                                           .frame(width:UIDevice.current.userInterfaceIdiom == .pad ?  900 : 650)
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
    ContentView(directions: .None, currentWeather: .init(time: "", dayOfWeek: "", imageName: "", condition: "", temperature: 0))
}
