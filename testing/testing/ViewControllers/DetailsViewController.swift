//
//  DetailsViewController.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import UIKit

protocol DetailsViewControllerProtocol{
    func updateProgressText(text: String)
    func updateProgressBarProgress(amount: Float) -> Bool
    func showCitiesData(cities: [City])
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var progressText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var citiesTableView: UITableView!
    
    let viewModel = DetailsViewModel()
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        progressBar.progress = 0
        viewModel.startProgressBarTimer()
        setUpTableView()
    }
    
}

//MARK: Protocol methods
extension DetailsViewController: DetailsViewControllerProtocol{
    
    func updateProgressText(text: String) {
        progressText.text = text
    }
    
    ///Update the progress bar by specific amount and return if the progress bar is filled or not
    func updateProgressBarProgress(amount: Float) -> Bool{
        progressBar.progress += amount
        return progressBar.progress == 1
    }
    
    ///Update the cities array and reload table view
    func showCitiesData(cities: [City]) {
        self.cities = cities
        citiesTableView.reloadData()
    }
}

//MARK: Table View
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    //Register the custom cell
    private func setUpTableView(){
        let nib = UINib(nibName: "CitiesWeatherTableViewCell", bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: "CityCell")
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = citiesTableView.dequeueReusableCell(withIdentifier: "CityCell",for: indexPath) as? CitiesWeatherTableViewCell {
            cell.setCellData(city: cities[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}
