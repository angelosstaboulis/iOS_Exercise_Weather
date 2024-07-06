//
//  StatusWeather.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI

struct StatusWeather: View {
    @EnvironmentObject var viewModel:ViewModel
    @State var currentDayWeather:CurrentDayWeather
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                HStack{
                    Text("New York").frame(width:80,height:60,alignment: .leading)
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                HStack{
                    Text(currentDayWeather.condition).frame(width:70,height:60,alignment: .center)
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                Image("me").resizable().clipShape(.circle).frame(width:65,height:60,alignment: .trailing)
            }.frame(width:400,height:60,alignment: .top)
            
            if currentDayWeather.imageName.count > 0{
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
            
        }.frame(width:400,height:350,alignment: .center)
            .padding(.top, 280)
            .task{
                currentDayWeather = await viewModel.getCurrentHourlyWeather()
            }
        
    }
}
