//
//  Codable.swift
//  IntoApp
//
//  Created by Usman Javaid on 18/11/2020.
//  Copyright © 2020 Incubators. All rights reserved.
//

import Foundation

extension Encodable {
    
    var toJSONString: String {
        get {
            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
            guard let _data = try? encoder.encode(self), let _jsonString = String(data: _data, encoding: .utf8) else {
                return ""
            }
            return _jsonString
        }
    }
    
}
