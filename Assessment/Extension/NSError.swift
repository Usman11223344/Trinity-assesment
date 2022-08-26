//
//  NSError.swift
//  IntoApp
//
//  Created by Usman Javaid on 18/11/2020.
//  Copyright © 2020 Incubators. All rights reserved.
//

import Foundation

extension NSError {
    var message: String {
        get {
            guard let _message = self.userInfo["message"] as? String else {
                return ErrorMessages.defaultError
            }
            
            return _message
        }
    }
}
