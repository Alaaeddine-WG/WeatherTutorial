//
//  WeatherAPIsUrl.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import Foundation

final class WeatherAPIsUrls{
    
    private static let baseUrl = "https://api.openweathermap.org/"
    private static let apiKey = "3a72eaf64f3c7fd81cdb020612e44420"
    
    static func weatherDetailsUrl(latitude: Double, longitude: Double) -> String{
        return "data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
    }
    
}
