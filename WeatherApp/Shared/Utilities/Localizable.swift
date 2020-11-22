//
//  Localizable.swift
//  WeatherApp
//
//  Created by Ümit on 21.11.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import UIKit
import Foundation

public protocol Localizable {
    var localized: String { get }
    var localizedArray: [String]? { get }
}

extension String: Localizable {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    public var localizedArray: [String]? {
        return self.localized.components(separatedBy: ",") as [String]
    }
}

public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
    
    @IBInspectable public var xibLocKeys: String? {
        get { return nil }
        set(key) {
            guard let values = key?.localized.components(separatedBy: ","), !values.isEmpty else { return }
            var tempValues = ""
            for value in values { tempValues += "\(value)\n" }
            text = tempValues
        }
    }
    
}

extension UIButton: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}

extension UINavigationItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}

extension UIBarItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}

public protocol XIBMultiLocalizable {
    var xibLocKeys: String? { get set }
}

public protocol UITextFieldXIBLocalizable {
    var xibPlaceholderLocKey: String? { get set }
}

extension UITextField: UITextFieldXIBLocalizable {
    @IBInspectable public var xibPlaceholderLocKey: String? {
        get { return nil }
        set(key) {
            placeholder = key?.localized
        }
    }
}
