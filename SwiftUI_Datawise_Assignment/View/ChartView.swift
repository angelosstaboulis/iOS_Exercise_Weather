//
//  ChartView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 19/6/24.
//

import SwiftUI
import Charts

struct ChartView: View {
   @Binding var weatherHourlyArray:[CurrentDayWeather]
    var body: some View {
        Chart{
            ForEach(weatherHourlyArray,id:\.self) { chart in
                   LineMark(
                       x: .value("Hour", chart.time),
                       y: .value("Temperature", chart.temperature)
                   )
                  
            }
        }.frame(height:100)
    }
}

#Preview {
    ChartView(weatherHourlyArray: .constant([]))
}
