//
//  Contact.swift
//  Contacts
//
//  Created by Mohammed Al-Dahleh on 2017-12-16.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

struct Contact {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let image: UIImage?
    var favorite: Bool
}

extension Contact {
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let phone = "phoneNumber"
        static let email = "email"
        static let street = "streetAddress"
        static let city = "city"
        static let state = "state"
        static let zip = "zip"
        static let image = "avatarName"
    }
    
    init?(dictionary: [String: String]) {
        guard let firstNameString = dictionary[Key.firstName],
            let lastNameString = dictionary[Key.lastName],
            let phoneString = dictionary[Key.phone],
            let emailString = dictionary[Key.email],
            let streetString = dictionary[Key.street],
            let cityString = dictionary[Key.city],
            let stateString = dictionary[Key.state],
            let zipString = dictionary[Key.zip] else { return nil }
        
        self.firstName = firstNameString
        self.lastName = lastNameString
        self.phone = phoneString
        self.email = emailString
        self.street = streetString
        self.city = cityString
        self.state = stateString
        self.zip = zipString
        
        if let imageName = dictionary[Key.image] {
            self.image = UIImage(named: imageName)
        } else {
            image = nil
        }
        
        favorite = false
    }
}
