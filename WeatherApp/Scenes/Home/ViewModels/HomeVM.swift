//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Foundation
import Moya

class HomeVM {
    
    let weatherService: MoyaProvider<WeatherService>
    
    init(weatherService: MoyaProvider<WeatherService>) {
        self.weatherService = weatherService
    }
    
}
