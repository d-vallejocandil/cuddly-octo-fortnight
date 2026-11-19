//
//  TableViewCell.swift
//  App2
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var favorite: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func render(horoscope: Horoscope) {
        name.text = horoscope.name
        dates.text = horoscope.dates
        icon.image = horoscope.icon
        favorite.isHidden = !Session().favorite(id: horoscope.id)
    }
}
