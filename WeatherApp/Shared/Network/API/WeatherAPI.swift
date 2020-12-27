//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Ümit on 26.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Moya

enum WeatherAPI: BaseService {
    case today(cityName: String)
}

extension WeatherAPI: TargetType {
    
    var path: String {
        switch self {
        case .today:
            return "weather"
        }
    }
    
    var method: Method {
        switch self {
        case .today:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .today(let cityName):
            let headerParameters: [String: Any] = [
                "q": cityName,
                "appid": "---"
            ]
            return .requestParameters(parameters: headerParameters, encoding: URLEncoding.default)
        }
    }
}

extension WeatherAPI {
    enum StubbedDataType: String {
        case CurrentWeatherResponse
    }
    
    var sampleData: Data {
        switch self {
        case .today:
            return stubbedResponse(fileName: StubbedDataType.CurrentWeatherResponse.rawValue)
        }
    }
}
