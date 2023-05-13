//
//  NetworkCall.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import Foundation

final class NetworkCall{
    
    func makeWeatherApiCall(city: City) async -> Result<City, ApiCallError>{
        
        guard let url = URL(string: WeatherAPIsUrls.weatherDetailsUrl(latitude: city.latitude, longitude: city.longitude)) else {
            return .failure(.url_error)
        }
        
        let request = URLRequest(url: url)
        
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            
            let weatherData: CityWeatherData = try JSONDecoder().decode(CityWeatherData.self, from: data)
            
            var newCityData = city
            newCityData.cityData = weatherData
            
            return .success(newCityData)
        }catch{
            print("Fetch weather data attempt for \(city.name) failed with error: \(error.localizedDescription)")
            return .failure(.unexpected_error)
        }
    }
}

enum ApiCallError: Error{
    case unexpected_error
    case json_encoder_error
    case url_error
    case unrecognized_response
    case email_or_password_incorrect
    case account_is_not_verified
}
