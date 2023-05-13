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
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var progressText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let viewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        progressBar.progress = 0
        viewModel.startProgressBarTimer()
    }
    
}

extension DetailsViewController: DetailsViewControllerProtocol{
    
    func updateProgressText(text: String) {
        progressText.text = text
    }
    
    ///Update the progress bar by specific amount and return if the progress bar is filled or not
    func updateProgressBarProgress(amount: Float) -> Bool{
        progressBar.progress += amount
        return progressBar.progress == 1
    }
}
