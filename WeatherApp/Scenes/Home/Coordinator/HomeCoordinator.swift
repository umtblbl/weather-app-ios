//
//  HomeCoordinator.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Foundation
import Swinject

final class HomeCoordinator: Coordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    let container: Container
    
    // MARK: - Vars & Lets
    
    let navigationController: UINavigationController
    
    // MARK: - Coordinator
    
    func start() {
        showHomeVC()
    }
    
    // MARK: - Init
    
    init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    // MARK: - Private metods
    
    private func showHomeVC() {
        let vc = container.resolveViewController(HomeVC.self)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
