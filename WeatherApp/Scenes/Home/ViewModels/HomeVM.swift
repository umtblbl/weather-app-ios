//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import RxSwift
import RxCocoa
import Action

extension HomeVM {
    struct Input {
        let todayForecastSubject: PublishSubject<String>        
    }
    struct Output {
        let todayForecastDriver: Driver<TodayForecastResponse>
    }
}

class HomeVM: ViewModel, ViewModelType {
    
    let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        super.init()
        //self.isLoading = indicator.asDriver()
        
    }
    
    func transform(input: Input) -> Output {
        
        let todayForecastDriver = input.todayForecastSubject.flatMap { [weak self] cityName -> Observable<TodayForecastResponse> in
            guard let self = self else { return .empty() }
            return self.weatherService.todayForecast(cityName: cityName).asObservable()
                .trackActivity(self.indicator)
                .trackError(self.error)
        }.asDriver(onErrorJustReturn: TodayForecastResponse())
        
        return Output(todayForecastDriver: todayForecastDriver)
    }
}
