//
//  ArrowsView.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 4/7/24.
//

import SwiftUI
enum Directions:Int{
    case Up = 0
    case Left = 1
    case Right = 2
    case Down = 3
}
struct ArrowsView: View {
    @State private var selectedCell = 2
    @State private var newSelection = 0
    @State var weatherDailyArray:[WeatherDay]
    @EnvironmentObject var viewModel:ViewModel
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            HStack{
                Button(action: {
                    gotoDirection(direction: .Up)
                }, label: {
                    Image(systemName: "chevron.left.2")
                })
                Button(action: {
                    gotoDirection(direction: .Left)
                }, label: {
                    Image(systemName: "arrow.left")
                })
                ScrollView(.horizontal){
                    HStack{
                        ForEach(weatherDailyArray.indices,id: \.self) { item in
                            WeatherDayView(day: weatherDailyArray[item])
                                .frame(width: 100, height: 150)
                                .id(item)
                        }
                    }
                }
                Button(action: {
                    gotoDirection(direction: .Right)
                }, label: {
                    Image(systemName: "arrow.right")
                })
                Button(action: {
                    gotoDirection(direction: .Down)
                }, label: {
                    Image(systemName: "chevron.right.2")
                })
            }
            .onChange(of: selectedCell) {
                scrollViewProxy.scrollTo(selectedCell, anchor: .center)
            }.task{
                weatherDailyArray = await viewModel.getDailyArrayWeather()

            }
        }

    }
    func gotoDirection(direction:Directions){
        switch direction{
            case .Up:
            selectedCell = 1
            newSelection = selectedCell
        case .Left:
            if newSelection == weatherDailyArray.count - 2{
                newSelection =  0
                selectedCell = newSelection
            }else{
                newSelection =  selectedCell + 1
                selectedCell = newSelection
            }
        case .Right:
            if newSelection == 1{
                newSelection =  weatherDailyArray.count - 1
                selectedCell = newSelection
            }else{
                newSelection =  selectedCell - 1
                selectedCell = newSelection
            }
        case .Down:
            selectedCell = weatherDailyArray.count - 1
            newSelection = selectedCell
        }
    }
}
