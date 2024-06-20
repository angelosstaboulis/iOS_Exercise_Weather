//
//  FetchWeatherDataViewModel.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
class FetchWeatherDataViewModel{
    let weather = FetchWeatherData()
    func fetchWeatherDataDaily(endPoint:String,completion:@escaping ([Model])->()){
        Task{
            await weather.fetchWeatherDataDaily(endpoint: endPoint) { array in
                completion(array)
            }
        }
    }
    func fetchWeatherDataHourly(endPoint:String,completion:@escaping ([Model])->()){
        Task{
            await weather.fetchWeatherDataHourly(endpoint: endPoint) { array in
                completion(array)
            }
        }
    }
}
