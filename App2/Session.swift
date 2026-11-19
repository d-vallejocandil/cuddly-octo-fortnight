//
//  Session.swift
//  App2
//
//  Created by Daniel Vallejo Candil on 19/11/2026.
//

import Foundation

class Session {
    private let standard = UserDefaults.standard
    func set(id: String) {
        standard.set(id, forKey: "favorite")
    }
    func get() -> String {
        standard.string(forKey: "favorite") ?? ""
    }
    func favorite(id: String) -> Bool {
        return get() == id
    }
}
