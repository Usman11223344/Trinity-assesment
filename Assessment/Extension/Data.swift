//
//  Data.swift
//  IntoApp
//
//  Created by Usman Javaid on 18/11/2020.
//  Copyright © 2020 Incubators. All rights reserved.
//

import Foundation

extension Data {
    
    var toJSONObject: Any? {
        guard let _jsonObject = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) else {
            return nil
        }
        return _jsonObject
    }
    
}
