//
//  ClientAPI.swift
//  WeatherApp
//
//  Created by Ümit on 20.09.2020.
//  Copyright © 2020 umtblbl. All rights reserved.
//

import Moya

protocol BaseAPI {
}

extension BaseAPI {
    
    var baseURL: URL {
        return Configs.Network.baseURL
    }
        
    var headers: [String : String]? {
        Configs.Network.headerFields
    }
    
    func stubbedResponse(fileName: String) -> Data {
        if let bundle = Bundle.main.url(forResource: fileName, withExtension: "json") {
            return (try? Data(contentsOf: bundle)) ?? Data()
        }
        return Data()
    }
}
