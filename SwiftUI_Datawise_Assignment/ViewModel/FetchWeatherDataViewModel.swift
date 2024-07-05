//
//  FetchWeatherDataViewModel.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
actor FetchWeatherDataViewModel{
    let weather = FetchWeatherData()
    func fetchWeatherDataDaily(endPoint:String) async->[Model]{
        return await weather.fetchWeatherDataDaily(endpoint: endPoint)
    }
    func fetchWeatherDataHourly(endPoint:String) async->[Model]{
        return await weather.fetchWeatherDataHourly(endpoint: endPoint)
    }
}
