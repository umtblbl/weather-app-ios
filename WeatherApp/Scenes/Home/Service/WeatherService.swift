//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Ümit on 20.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Moya
import RxSwift

protocol WeatherServiceProtocol {
    var weatherServiceProvider: MoyaProvider<WeatherAPI> { get }
    func todayForecast(cityName: String) -> Single<TodayForecastResponse>
    //func fourDays(cityName: String) -> Observable<String>
}

struct WeatherService: WeatherServiceProtocol {
    
    var weatherServiceProvider: MoyaProvider<WeatherAPI>
    
    func todayForecast(cityName: String) -> Single<TodayForecastResponse> {
        return weatherServiceProvider.rx
            .request(.today(cityName: cityName))
            .map(TodayForecastResponse.self)
            .asObservable()
            .asSingle()
    }
}
