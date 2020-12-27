//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import UIKit
import RxSwift

class HomeVC: ViewController, HomeStoryboardLodable {
    
    @IBOutlet weak var weatherDescLabel: UILabel?
    @IBOutlet weak var weatherHumidityLabel: UILabel?
    @IBOutlet weak var weatherWindSpeedLabel: UILabel?
    @IBOutlet weak var weatherPressureLabel: UILabel?
    @IBOutlet weak var weatherTempLabel: UILabel?
    @IBOutlet weak var cityNameLabel: UILabel?
    @IBOutlet weak var weatherRefreshButton: UIButton!
    
    var homeVM: HomeVM?
    
    let todayForecastSubject = PublishSubject<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayForecastSubject.onNext("Istanbul")
    }
    
    override func bindViewModel() {
        
        let output = homeVM?.transform(input: .init(todayForecastSubject: todayForecastSubject) )
        
        output?.todayForecastDriver.drive(onNext: { [weak self] response in
            print(response)
        }).disposed(by: rx.disposeBag)
    }
}
