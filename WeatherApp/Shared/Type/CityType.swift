//
//  CityType.swift
//  WeatherApp
//
//  Created by Ümit on 27.12.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Foundation

enum CityType: String {
    case Istanbul
}

extension CityType {
    var cityName: String {
        switch self {
        case .Istanbul:
            return L10n.City.istanbul
        }
    }
}
