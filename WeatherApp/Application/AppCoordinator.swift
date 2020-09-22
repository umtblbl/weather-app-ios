//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//


import UIKit
import Swinject

enum AppChildCoordinator {
    case auth
    case home
}

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow
    let container: Container
        
    private var navigationController: UINavigationController
    private var childCoordinators = [AppChildCoordinator: Coordinator]()
    
    // MARK: - Init
    
    init(window: UIWindow, container: Container, navigationController: UINavigationController) {
        self.window = window
        self.container = container
        self.navigationController = navigationController        
        self.window.rootViewController = navigationController
    }
    
    // MARK: - Coordinator
    
    func start() {
        //For example; AuthCoordinator can be added to AppCoordinator and the relevant Coordinator can be triggered according to the Login control here.
        runHomeFlow()
    }
    
    // MARK: - Private methods
    
    private func runHomeFlow() {
        let coordinator = HomeCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.home] = nil
            self.navigationController.viewControllers.removeAll()
            self.start()
        }
        childCoordinators[.home] = coordinator
        coordinator.start()
    }
    
    
}

