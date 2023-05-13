//
//  NetworkCall.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import Foundation

final class NetworkCall{
    
    //MARK: Login api call
    func tryLoginApiCall(userInfo: User) async -> Result<String,LoginApiCallError>{
        
        //encoding json data
        let encodedData: Data
        do{
            encodedData = try JSONEncoder().encode(userInfo)
        }catch{
            return .failure(.json_encoder_error)
        }
        
        // Send request
        guard let url = URL(string: APIsUrls.loginUrl) else {
            return .failure(.url_error)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedData
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            
            guard let response = String(data: data, encoding: .utf8) else {
                return .failure(.unrecognized_response)
            }
            
            if(response.count == 0){
                return .failure(.unrecognized_response)
            }else if(response.contains("LOGIN OR PASSWORD IS INCORRECT")){
                return .failure(.email_or_password_incorrect)
            }else if(response.contains("USER IS NOT ENABLED YET")){
                return .failure(.account_is_not_verified)
            }else{
                return .success(response)
            }
        }catch{
            return .failure(.unexpected_error)
        }
    }
}
