//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeVM: ViewModel {
    
    let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        super.init()
        //self.isLoading = indicator.asDriver()
        
    }
    
    func todayForecast(cityName: String) -> Observable<TodayForecastResponse> {
        return weatherService.todayForecast(cityName: cityName).asObservable()
            .trackActivity(indicator)
            .trackError(error)
    }
}
