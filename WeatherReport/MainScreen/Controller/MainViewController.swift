//
//  ViewController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//

import UIKit

class MainViewController: UIViewController {

    let viewModel: MainScreenViewModelProtocol = MainScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        viewModel.fetchOneCallWeather { result in
            print(result)
        }
    }
}

