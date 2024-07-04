//
//  FetchWeatherData.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 18/6/24.
//

import Foundation
import Alamofire
actor FetchWeatherDataHourly{
    func fetchWeatherDataHourly(endpoint:String) async->[Model]{
        return await withCheckedContinuation { continuation in
            guard let baseURL = URL(string:"https://test.dev.datawise.ai/") else{
                return
            }
            guard let request = RequestBuilder(path: endpoint)
                .makeRequest(baseURL: baseURL) else{
                return
            }
            AF.request(request).response { dataResponse in
                switch (dataResponse.result){
                case .success(_):
                    do{
                        let decode = try JSONDecoder().decode([Model].self, from: dataResponse.data!)
                        continuation.resume(returning: decode)
                    }
                    catch{
                        debugPrint((error.localizedDescription))
                    }
                case .failure(let error):
                    debugPrint("something went wrong=",error.localizedDescription)
                    
                }
            }
        }
       
    }
}
actor FetchWeatherDataDaily{
    func fetchWeatherDataDaily(endpoint:String) async->[Model]{
        return await withCheckedContinuation { continuation in
            guard let baseURL = URL(string:"https://test.dev.datawise.ai/") else{
                return
            }
            guard let request = RequestBuilder(path: endpoint)
                .makeRequest(baseURL: baseURL) else{
                return
            }
            AF.request(request).response { dataResponse in
                switch (dataResponse.result){
                case .success(_):
                    do{
                        let decode = try JSONDecoder().decode([Model].self, from: dataResponse.data!)
                        continuation.resume(returning: decode)
                    }
                    catch{
                        debugPrint((error.localizedDescription))
                    }
                case .failure(let error):
                    debugPrint("something went wrong=",error.localizedDescription)
                    
                }
            }
        }
    }
}
actor FetchWeatherData{
    let daily = FetchWeatherDataDaily()
    let hourly = FetchWeatherDataHourly()
    func fetchWeatherDataDaily(endpoint:String) async->[Model]{
            return await daily.fetchWeatherDataDaily(endpoint: endpoint)
    }
    func fetchWeatherDataHourly(endpoint:String) async->[Model]{
        return await hourly.fetchWeatherDataHourly(endpoint: endpoint)
    }
}
