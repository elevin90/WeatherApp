//
//  SettingsViewController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 9.05.21.
//

import UIKit


class SettingsViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
