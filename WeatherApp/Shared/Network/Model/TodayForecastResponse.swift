//
//  TodayForecastResponse.swift
//  WeatherApp
//
//  Created by Ümit on 26.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Foundation

struct TodayForecastResponse: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

struct Clouds: Codable {
    let all: Int?
}

struct Coord: Codable{
    let lon, lat: Double?
}

struct Main: Codable{
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?
}

struct Sys: Codable{
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
}

struct Weather: Codable{
    let id: Int?
    let main, weatherDescription, icon: String?
}

struct Wind: Codable{
    let speed: Double?
    let deg: Int?
}

