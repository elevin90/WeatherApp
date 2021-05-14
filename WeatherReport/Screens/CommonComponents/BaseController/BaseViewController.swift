//
//  BaseViewController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 9.05.21.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.mainBackground
    }
}
