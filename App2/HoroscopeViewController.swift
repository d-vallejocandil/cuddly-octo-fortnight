//
//  HoroscopeViewController.swift
//  App2
//
//  Created by Daniel Vallejo Candil on 19/11/2026.
//

import UIKit

class HoroscopeViewController: UIViewController {
    var horoscope: Horoscope!
    @IBOutlet weak var favorite: UIBarButtonItem!
    var isFavorite = false
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = horoscope.name
        navigationItem.subtitle = horoscope.id
        isFavorite = Session().favorite(id: horoscope.id)
        set_image()
    }
    @IBAction func favorite(_ sender: Any) {
        let session = Session()
        if isFavorite {
            session.set(id: "")
        } else {
            session.set(id: horoscope.id)
        }
        isFavorite = !isFavorite
        set_image()
    }
    @IBAction func share(_ sender: Any) {
        let text = "Share text."
        let share = [text]
        let view_controller = UIActivityViewController(activityItems: share, applicationActivities: nil)
        self.present(view_controller, animated: true, completion: nil)
    }
    func set_image() {
        if isFavorite {
            favorite.image = UIImage(systemName: "heart.fill")
        } else {
            favorite.image = UIImage(systemName: "heart")
        }
    }
}
