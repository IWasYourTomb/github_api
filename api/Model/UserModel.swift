//
//  model.swift
//  api
//
//  Created by 1 on 23.05.2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let login: String?
    let avatar_url: String?
    
    init(id: Int, login: String?, avatar_url: String?) {
        self.id = id
        self.login = login
        self.avatar_url = avatar_url
    }
}
