//
//  ConditionWeather.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI

struct ConditionWeather: View {
    @Binding var currentWeather:CurrentDayWeather
    var body: some View {
        HStack{
            Grid(horizontalSpacing: 65) {
                GridRow{
                    HStack{
                        Text("New York").frame(width:80,height:60,alignment: .leading)
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text(currentWeather.condition).frame(width:70,height:60,alignment: .center)
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.white)
                    }
                    Image("me").resizable().clipShape(.circle).frame(width:65,height:60,alignment: .trailing)
                }
            }.frame(width:600,height:60)
                .padding(130)
            
        }.frame(width:400,height:220,alignment: .top)
            
        
    }
}

