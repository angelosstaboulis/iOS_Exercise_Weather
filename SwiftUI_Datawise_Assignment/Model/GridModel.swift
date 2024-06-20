//
//  GridModel.swift
//  SwiftUI_Datawise_Assignment
//
//  Created by Angelos Staboulis on 19/6/24.
//

import Foundation
struct GridModel: Identifiable,Hashable {
    let id = UUID()
    let town: String
    let condition: String
    let imagename:String
    func hash(into hasher: inout Hasher) {
        
    }
}
