//
//  ViewController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//

import UIKit

class ViewController: UIViewController {

    let viewModel: MainScreenViewModelProtocol = MainScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchOneCallWeather { result in
            print(result)
        }
    }
}

