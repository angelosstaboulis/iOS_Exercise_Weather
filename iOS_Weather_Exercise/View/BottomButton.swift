//
//  BottomButton.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI

struct BottomButton: View {
    var body: some View {
        Button {
            
        } label: {
            WeatherButton(title: "5-day forecast", textColor: .white, backColor: .orange)
        }.frame(width:300,height:45,alignment: .bottom)
        Spacer()
        Spacer()
        Spacer()
    }
}

