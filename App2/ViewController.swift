//
//  ViewController.swift
//  App2
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Horoscope.horoscopes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope", for: indexPath) as! TableViewCell
        let horoscope = Horoscope.horoscopes[indexPath.row]
        cell.render(horoscope: horoscope)
        return cell
    }
}
