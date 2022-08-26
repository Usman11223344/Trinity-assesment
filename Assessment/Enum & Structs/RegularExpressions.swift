//
//  RegularExpressions.swift
//  iOSApplication
//
//  Created by Usman Javaid on 18/11/2019.
//  Copyright © 2019 Incubators. All rights reserved.
//

import Foundation

struct Regex {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let phoneNumber = "^[1{1}]\\s\\d{3}-\\d{3}-\\d{4}$"
}
