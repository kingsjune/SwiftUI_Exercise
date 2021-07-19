//
//  WheatherViewModel.swift
//  SwiftUIExample
//
//  Created by BHJ on 2021/07/14.
//

import Foundation
import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: [Weather] = []
    init() {
        fetchWheather()
    }
    func tetchWheatherSecond() {
        
    }
}
extension WeatherViewModel {
    func fetchWheather() {
        NetworkManager.getWeather(searchCity: "seoul") { result in
            switch result {
            case .success(let weather):
                print(weather)
            case .failure(let err):
                print(err)
            }
        }
    }
}
