//
//  File.swift
//  
//
//  Created by zhtg on 2023/5/11.
//


#if os(iOS)

import UIKit

public extension UIViewController {

    static var current: UIViewController? {
        var topController = UIWindow.rootController
        while true {
            if let presented = topController?.presentedViewController,
               !presented.isSystemController {
                topController = presented
            } else if let navi = topController as? UINavigationController {
                topController = navi.topViewController
            } else if let tabBar = topController as? UITabBarController {
                topController = tabBar.selectedViewController
            } else {
                break
            }
        }
        return topController
    }

    var isSystemController: Bool {
        if systemControllers.contains(where: { type in
            type == Self.self
        }) {
            return true
        }
        return false
    }

    var systemControllers: [UIViewController.Type] {
        return [UIAlertController.self,
                UIImagePickerController.self,
                UIActivityViewController.self,
                UIDocumentPickerViewController.self,
                UIInputViewController.self]
    }
}


#endif
