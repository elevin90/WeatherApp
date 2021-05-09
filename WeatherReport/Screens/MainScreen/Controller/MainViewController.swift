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
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.mainBackground
//        viewModel.fetchOneCallWeather { result in
//            print(result)
//        }
    }
}

