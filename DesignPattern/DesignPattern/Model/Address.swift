//
//  Address.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import Foundation
struct Address {
    // MARK: - Variables
    var street: String
    var city: String
    var state: String
    var zipCode: String
    
    // MARK: - Initializers
    init(_ street: String, _ city: String, _ state: String, _ zipCode: String) {
        self.street = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
    // MARK: - Methods
    static func getRandomAddress() -> Address {
        return Address("2100 Wordsworth Ct, Apt 404", "Herndon", "Virginia", "20170")
    }
}
