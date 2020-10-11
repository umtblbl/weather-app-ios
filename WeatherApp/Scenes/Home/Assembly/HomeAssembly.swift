//
//  HomeAssembly.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Foundation
import Swinject
import Moya

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
        
        // Services
        container.register(WeatherService.self, factory: { _ in
            WeatherService(weatherServiceProvider: MoyaProvider<WeatherAPI>())
        }).inObjectScope(ObjectScope.container)
   
        // ViewModels
        container.register(HomeVM.self, factory: { container in
            HomeVM(weatherService: container.resolve(WeatherService.self)!)
        }).inObjectScope(ObjectScope.container)
        
        // ViewControllers
        container.storyboardInitCompleted(HomeVC.self) { r, c in
            c.homeVM = r.resolve(HomeVM.self)
        }
        
    }
}
