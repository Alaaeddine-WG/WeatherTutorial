//
//  ViewController.swift
//  testing
//
//  Created by WG CONSULTING on 13/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openNewPageBtnAction(){
        guard let viewCon = storyboard?.instantiateViewController(withIdentifier: "DetailsView") as? DetailsViewController else {
            return
        }
        
        viewCon.modalPresentationStyle = .fullScreen
        present(viewCon, animated: true)
    }
}
