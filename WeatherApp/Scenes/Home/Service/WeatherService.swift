//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Ümit on 20.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Moya

enum WeatherService: BaseService {
    case today(cityName: String)
    case fourDays(cityName: String)
}

extension WeatherService: TargetType {
    
    var path: String {
        switch self {
        case .today:
            return "weather"
        case .fourDays:
            return "forecast/hourly"
        }
    }
    
    var method: Method {
        switch self {
        case .today, .fourDays:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .today(let cityName):
            let headerParameters: [String: Any] = [
                "q": cityName
            ]
            return .requestParameters(parameters: headerParameters, encoding: URLEncoding.default)
        case .fourDays(let cityName):
            let headerParameters: [String: Any] = [
                "q": cityName
            ]
            return .requestParameters(parameters: headerParameters, encoding: URLEncoding.default)
        }
    }
    
    
}

extension WeatherService {
    enum StubbedDataType: String {
        case HourlyWeatherResponse
        case CurrentWeatherResponse
    }
    
    var sampleData: Data {
        switch self {
        case .today:
            return stubbedResponse(fileName: StubbedDataType.CurrentWeatherResponse.rawValue)
        default:
            return stubbedResponse(fileName: StubbedDataType.HourlyWeatherResponse.rawValue)
        }
    }
}
