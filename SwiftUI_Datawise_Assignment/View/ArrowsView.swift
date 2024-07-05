//
//  ArrowsView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI

struct ArrowsView: View {
    @State private var selectedCell = 2
    @State private var newSelection = 0
    @State var weatherDailyArray:[WeatherDay] = []
    @State var fetchWeather = FetchWeatherData()
    let helper = Helper()
    var body: some View {
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
            let fetchArray =  await fetchWeather.fetchWeatherDataDaily(endpoint: "/daily")
            for item in fetchArray{
                weatherDailyArray.append(WeatherDay(dayOfWeek: helper.convertISODate(date:item.date), imageName:  helper.createIcon(condition: item.condition), condition: item.condition, temperature: item.temperature))
            }
        }
    }
}

#Preview {
    ArrowsView()
}
