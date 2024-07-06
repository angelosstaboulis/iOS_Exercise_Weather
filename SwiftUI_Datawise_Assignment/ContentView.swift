//
//  ContentView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 17/6/24.
//

import SwiftUI
import Foundation
struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                StatusWeather(currentDayWeather: .init(time: "", dayOfWeek: "", imageName: "", condition: "", temperature: 0))
                    .frame(width: 400,height:360,alignment: .center)
                Spacer()
                ArrowsView(weatherDailyArray: []).frame(width: 400,height:160,alignment: .center)
                BottomChartView(weatherHourlyArray: []).frame(width: 400,height:160,alignment: .center)
                BottomButton().frame(width: 400,height:60,alignment: .bottom)
            }.frame(height:UIDevice.current.userInterfaceIdiom == .pad ?  1290 : 1100)
           
                
        }
        
    }
}
