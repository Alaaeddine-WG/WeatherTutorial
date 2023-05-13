//
//  DetailsViewModel.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import Foundation


class DetailsViewModel{
    
    var delegate: DetailsViewControllerProtocol?
    
    private var progressBarFillTime: Float = 60 //in seconds
    private var progressTimeInterval: Float
    private var secondsCounter: Int = 0
    
    //Cities with coordinates
    let cities: [City] = [
    City(name: "Rennes", latitude: 48.1113387, longitude: -1.6800198),
    City(name: "Paris", latitude: 48.8588897, longitude: 2.320041),
    City(name: "Nantes", latitude: 47.2186371, longitude: -1.5541362),
    City(name: "Bordeaux", latitude: 44.841225, longitude: -0.5800364),
    City(name: "Lyon", latitude: 45.7578137, longitude: 4.8320114),
    ]
    
    //texts
    private let texts = ["text1", "text2", "text3"]
    private let textChangeInterval: Int = 6 //in seconds
    private var currentTextIndex:Int = -1
    
    init() {
        progressTimeInterval = 1/progressBarFillTime
    }
    
    func startProgressBarTimer(){
        //Show the first text
        delegate?.updateProgressText(text: getNextTextToShow())
        
        //Start timer
        let timer = Timer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func fireTimer(timer: Timer){
        secondsCounter += 1
        
        if delegate!.updateProgressBarProgress(amount: progressTimeInterval){
            print("Done counting")
            timer.invalidate()
        }
        
        //Update text every 6 seconds
        if (secondsCounter % textChangeInterval == 0){
            delegate?.updateProgressText(text: getNextTextToShow())
        }
    }
    
    private func getNextTextToShow() -> String{
        currentTextIndex += 1
        if currentTextIndex >= texts.count{
            currentTextIndex = 0
        }
        
        return texts[currentTextIndex]
    }
    
    private func loadWeatherData(){
        Task{
            
        }
    }
}
