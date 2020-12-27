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
        cityForecastRequest(cityType: .Istanbul)
    }
    
    override func bindViewModel() {
        
        let output = homeVM?.transform(input: .init(todayForecastSubject: todayForecastSubject) )
     
        weatherRefreshButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.cityForecastRequest(cityType: .Istanbul)
        }).disposed(by: rx.disposeBag)
        
        output?.todayForecastDriver.drive(onNext: { [weak self] response in
            self?.handleTodayForecast(forecast: response)
        }).disposed(by: rx.disposeBag)
    }
}

extension HomeVC {
    private func cityForecastRequest(cityType: CityType) {
        todayForecastSubject.onNext(cityType.rawValue)
        self.cityNameLabel?.text = cityType.cityName
    }
    
    private func handleTodayForecast(forecast: TodayForecastResponse) {
        if let weatherMain = forecast.weather?.first?.main, let weatherDescription = forecast.weather?.first?.weatherDescription {
            self.weatherDescLabel?.text = weatherMain + " " + weatherDescription
        }
        self.weatherHumidityLabel?.text = String(forecast.main?.humidity ?? 0)
        self.weatherWindSpeedLabel?.text = String(forecast.wind?.speed ?? 0)
        self.weatherPressureLabel?.text = String(forecast.main?.pressure ?? 0)
        self.weatherTempLabel?.text = String(forecast.main?.temp ?? 0)
    }
}
