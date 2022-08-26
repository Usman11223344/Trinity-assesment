//
//  UIDevice.swift
//  OldCare
//
//  Created by Eman Tahir on 28/03/2022.
//

import Foundation
import UIKit

extension UIDevice{
    static var device: Device {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return .ipad
        }
        else {
            return .iphone
        }
    }
    
}
