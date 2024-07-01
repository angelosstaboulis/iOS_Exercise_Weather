//
//  WeatherDayView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import SwiftUI
struct WeatherDayView: View {
    @State var day:WeatherDay
    
    var body: some View {
        VStack {
            Text(day.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName:day.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(day.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    WeatherDayView(day:.init(dayOfWeek: "", imageName: "", condition: "", temperature: 0))
}
