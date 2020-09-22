//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Ümit on 20.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var assembler: Assembler!
    private var appCoordinator: AppCoordinator!
    internal let container = Container()
    
    func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        assembler = Assembler([
            HomeAssembly()
        ], container: container)
        
        return true
    }
    
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        appCoordinator = AppCoordinator(window: window!, container: container, navigationController: UINavigationController())
        appCoordinator.start()
        
        window?.makeKeyAndVisible()
        
        return true
    }


}

