//
//  BottomChartView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI
import Charts
struct BottomChartView: View {
    @EnvironmentObject var viewModel:ViewModel
    @State var weatherHourlyArray:[CurrentDayWeather]
    var body: some View {
        ScrollView(.horizontal){
            VStack{
                Chart{
                    ForEach(weatherHourlyArray,id:\.self) { chart in
                        LineMark(
                            x: .value("Hour", chart.time),
                            y: .value("Temperature", chart.temperature)
                        )
                        
                    }
                }.frame(width:UIDevice.current.userInterfaceIdiom == .pad ?  900 : 650)
                .task{
                        weatherHourlyArray = await viewModel.getHourlyArrayWeather()
                }
            }.frame(height:120)
        }
    }
}


