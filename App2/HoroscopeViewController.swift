//
//  HoroscopeViewController.swift
//  App2
//
//  Created by Daniel Vallejo Candil on 19/11/2026.
//

import UIKit

class HoroscopeViewController: UIViewController {
    var horoscope: Horoscope!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = horoscope.name
        navigationItem.subtitle = horoscope.id
    }
}
