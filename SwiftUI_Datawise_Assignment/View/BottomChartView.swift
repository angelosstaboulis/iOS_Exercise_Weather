//
//  BottomChartView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI

struct BottomChartView: View {
    @Binding var weatherHourlyArray:[CurrentDayWeather]
    var body: some View {
        ScrollView(.horizontal){
                           VStack{
                               ChartView(weatherHourlyArray: $weatherHourlyArray)
                                   .frame(width:UIDevice.current.userInterfaceIdiom == .pad ?  900 : 650)
                                   
                           }.frame(height:150)
                       }
    }
}


