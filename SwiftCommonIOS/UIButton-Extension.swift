/**
 # UIButton-Extension.swift
## SwiftCommonIOS
 
 - Author: Andrew Bradnan
 - Date: 5/24/16
 - Copyright: Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension UIButton {
    func doHide(hide: Bool) {
        self.hidden = hide
        self.accessibilityElementsHidden = hide
        self.enabled = !hide
        self.isAccessibilityElement = !hide
    }
    
    /// proper hide() that works with accessibility (seealso: show())
    public func hide() {
        doHide(true)
    }
    
    /// proper show() that works with accessibility (seealso: hide())
    func show() {
        doHide(false)
    }
}
