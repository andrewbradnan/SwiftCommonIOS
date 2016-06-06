/**
 # UIApplication-Extension.swift
## SwiftCommonIOS

 - Author: Andrew Bradnan
 - Date: 5/23/16
 - Copyright: © 2016 Belkin. All rights reserved.
*/

import SwiftCommon

extension UIApplication {

    public var splashImageName: String? { return self.splashImageNameForOrientation(self.deviceOrientation) }

    public var deviceOrientation : UIDeviceOrientation {
        get {
            switch self.statusBarOrientation {
            case .Portrait:
                return .PortraitUpsideDown
            case .LandscapeLeft:
                return .LandscapeRight
            case .LandscapeRight:
                return .LandscapeLeft
            default:
                return .Portrait
            }
        }
    }
    
    internal func splashImageNameForOrientation(orientation: UIDeviceOrientation) -> String? {
        var viewSize = UIScreen.mainScreen().bounds.size
        
        let viewOrientation = orientation.isPortrait ? "Portrait" : "Landscape"
        if orientation.isLandscape {
            viewSize = viewSize.swap()
        }
        
        if let info = NSBundle.mainBundle().infoDictionary {
            let i = info["UILaunchImages"]!
            let imagesDict = i as! [[String: String]]
            
            for dict in imagesDict {
                if let szImageSize = dict["UILaunchImageSize"] {
                    let imageSize = CGSizeFromString(szImageSize)
                    if (CGSizeEqualToSize(imageSize, viewSize) && viewOrientation == dict["UILaunchImageOrientation"]) {
                        return dict["UILaunchImageName"]
                    }
                }
            }
        }
        return nil
    }
    
}

