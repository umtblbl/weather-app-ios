//
//  Extension+Storyboard.swift
//  WeatherApp
//
//  Created by Ümit on 22.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case Home
    case Auth
}

protocol StoryboardLodable: AnyObject {
    @nonobjc static var storyboardName: String { get }
}

protocol HomeStoryboardLodable: StoryboardLodable {}

protocol AuthStoryboardLodable: StoryboardLodable {}

extension HomeStoryboardLodable where Self: UIViewController {
    @nonobjc static var storyboardName: String {
        return AppStoryboard.Home.rawValue
    }
}
