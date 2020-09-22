//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//


import UIKit
import Swinject

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}

protocol Coordinator: AnyObject {
    /**
     DI container
     */
    var container: Container { get }
    
    /**
     Entry point starting the coordinator
     */
    func start()
}

protocol NavigationCoordinator: Coordinator {
    /**
     Navigation controller
     */
    var navigationController: UINavigationController { get }
}

