//
//  WeatherButton.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(20)
    }
}

#Preview {
    WeatherButton(title: "", textColor: .white, backColor: .blue)
}
