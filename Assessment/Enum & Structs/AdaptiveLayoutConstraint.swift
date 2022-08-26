//
//  AdaptiveLayoutConstraint.swift
//  iOSApplication
//
//  Created by Usman Javaid on 20/11/2019.
//  Copyright © 2019 Incubators. All rights reserved.
//

import Foundation
import UIKit

class AdaptiveLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable var setAdaptiveLayout: Bool = false
    
    override func awakeFromNib() {
        if setAdaptiveLayout {
            self.constant = self.constant.relativeToIphone8Width()
            
            if let firstView = self.firstItem as? UIView {
                firstView.layoutIfNeeded()
            }
            if let secondVIew = self.secondItem as? UIView {
                secondVIew.layoutIfNeeded()
            }
        }
    }
    
}
