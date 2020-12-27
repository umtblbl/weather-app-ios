//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Ümit on 8.10.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class ViewModel {
    let error = ErrorTracker()
    let indicator = ActivityIndicator()
}
