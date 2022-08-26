//
//  Contacts.swift
//  Assessment
//
//  Created by Swoop on 26/08/2022.
//

import Foundation

struct Contact: Codable {
    var conatctId, firstName, lastName, email: String?
    var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case conatctId = "id"
        case firstName, lastName, email, phone
    }
}
