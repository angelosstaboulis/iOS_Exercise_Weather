//
//  CityTextView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import SwiftUI

struct ConditionTextView: View {
    @Binding var condition: CurrentDayWeather
    var body: some View {
        Grid(horizontalSpacing: 65) {
            GridRow{
                HStack{
                    Text("New York").frame(width:80,height:60,alignment: .leading)
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                HStack{
                    Text(condition.condition).frame(width:70,height:60,alignment: .center)
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                Image("me").resizable().clipShape(.circle).frame(width:65,height:60,alignment: .trailing)
            }
        }.frame(width:600,height:60)
            .padding(130)
        
    }
}
