//
//  URLRequest.swift
//  IntoApp
//
//  Created by Usman Javaid on 18/11/2020.
//  Copyright © 2020 Incubators. All rights reserved.
//

import Foundation

extension URLRequest {
    
    mutating func addHeaders(WithAPIName apiName: String, contentType: String = "application/json") {
        self.setValue(AppConfig.apiKey, forHTTPHeaderField: "ak")
        self.setValue(apiName, forHTTPHeaderField: "an")
        self.setValue(AppConfig.apiVersion, forHTTPHeaderField: "av")
        self.setValue(contentType, forHTTPHeaderField: "Content-Type")
    }
    
}
