//
//  ViewController.swift
//  App2
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var table: UITableView!
    var horoscopes = Horoscope.horoscopes
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        let search = UISearchController()
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope", for: indexPath) as! TableViewCell
        let horoscope = horoscopes[indexPath.row]
        cell.render(horoscope: horoscope)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view_controller = segue.destination as! HoroscopeViewController
        let index = table.indexPathForSelectedRow!
        view_controller.horoscope = horoscopes[index.row]
        table.deselectRow(at: index, animated: false)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopes = Horoscope.horoscopes
        table.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            horoscopes = Horoscope.horoscopes
        } else {
            horoscopes = Horoscope.horoscopes.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        table.reloadData()
    }
}
