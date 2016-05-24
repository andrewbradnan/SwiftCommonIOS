/**
 # UIView-Extension.swift
 ##  SwiftCommonIOS
 
 - Author: Andrew Bradnan
 - Date: 5/24/16
 - Copyright:   Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension UIView {
    /// Add tap handler
    public func addTarget(target: AnyObject, action: Selector) {
        self.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target:target, action:action)
        self.addGestureRecognizer(tap)
    }
}
