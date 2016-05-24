/**
 # UIViewController-Extension.swift
## SwiftCommonIOS
 
 - Author: Andrew Bradnan
 - Date: 5/24/16
 - Copyright: Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation
import SwiftCommon

extension UIViewController {
    /// Show error...
    public func showError(title: String, err: String, onOK: Block? = nil) {
        let alert = UIAlertController(title: title,
                                      message: err,
                                      preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in onOK?() })
        
        dispatch_async(dispatch_get_main_queue(), {
            self.presentViewController(alert, animated: true, completion: nil)
        })
    }
}