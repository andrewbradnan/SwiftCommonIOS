/**
 # UIImage-Extension.swift
## SwiftCommonIOS
 
 - Author: Andrew Bradnan
 - Date: 5/24/16
 - Copyright: Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension UIImage {
    
    /**
     Scale an UIImage up or down.
     
     - Parameter ratio: Ratio to scale by.
    */
    public func scaleBy(ratio: Double) -> UIImage {
        let fratio = CGFloat(ratio)
        let scaledSize = CGSizeMake(self.size.width * fratio, self.size.height * fratio)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapBytesPerRow = Int(size.width * 4)
        
        // The output context.
        UIGraphicsBeginImageContext(scaledSize)
        let context = CGBitmapContextCreate (nil,
                                             Int(scaledSize.width),
                                             Int(scaledSize.height),
                                             8,      // bits per component
            bitmapBytesPerRow,
            colorSpace,
            CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue).rawValue)
        
        // Scale.
        CGContextScaleCTM(context, fratio * 1.01, fratio * 1.01)
        self.drawAtPoint(CGPointZero)
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
}
