//
//  City.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import Foundation

struct City{
    let name: String
    let latitude: Double
    let longitude: Double
    var cityData: CityWeatherData?
}

struct CityWeatherData: Decodable{
    let weather: [Weather]
    let main: Main
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let main, description, icon: String
}
