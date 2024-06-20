//
//  WeatherStatusView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import SwiftUI

struct WeatherStatusView: View {
    @Binding var currentDayWeather:CurrentDayWeather
    var body: some View {
        VStack(spacing: 10) {
            if currentDayWeather.imageName.count > 0 {
                Image(systemName:currentDayWeather.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                Text("\(currentDayWeather.temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
                Text("\(currentDayWeather.dayOfWeek)")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 40)
       
    }
}

