//
//  Dictionary.swift
//  IntoApp
//
//  Created by Usman Javaid on 18/11/2020.
//  Copyright © 2020 Incubators. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    var toData: Data? {
        guard let _data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted) else {
            return nil
        }
        return _data
    }
}
