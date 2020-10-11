//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import UIKit

class HomeVC: ViewController, HomeStoryboardLodable {

    var homeVM: HomeVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        homeVM.todayForecast(cityName: "İzmir").subscribe(onNext: { response in
            print(response)
        }).disposed(by: rx.disposeBag)
    }
}
