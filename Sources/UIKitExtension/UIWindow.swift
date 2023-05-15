//
//  File.swift
//  
//
//  Created by zhtg on 2023/5/11.
//


#if os(iOS)

import UIKit

@available(iOS 13.0, *)
public extension UIWindow {

    static var rootController: UIViewController? {
        keyWindow?.rootViewController
    }

    static var activeWindowScene: UIWindowScene? {
        // 列出所有scene
        let connectedScenes = UIApplication.shared.connectedScenes
        guard connectedScenes.count > 0 else {
            print("no connected scene")
            return nil
        }
        // 过滤非windowScene的
        let windowScenes = connectedScenes.filter({ $0 is UIWindowScene })
        var matchedScene: UIScene
        if windowScenes.count == 1, let first = windowScenes.first {
            matchedScene = first
        } else {
            if let activeScene = windowScenes.first(where: { $0.activationState == .foregroundActive }) {
                matchedScene = activeScene
            } else if let inactiveScene = connectedScenes.first(where: { $0.activationState == .foregroundInactive }) {
                matchedScene = inactiveScene
            } else if let first = windowScenes.first {
                matchedScene = first
            } else {
                print("no matched scene found")
                return nil
            }
        }
        guard let windowScene = matchedScene as? UIWindowScene else {
            print("matched scene is not windowScene")
            return nil
        }
        return windowScene
    }

    static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            guard let windowScene = activeWindowScene else {
                return nil
            }
            if #available(iOS 15.0, *) {
                if let keyWindow = windowScene.keyWindow {
                    return keyWindow
                }
            } else {
                if let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
                    return keyWindow
                }
            }
        } else {
            // Fallback on earlier versions
            if let window = UIApplication.shared.keyWindow {
                return window
            }
        }
        return nil
    }
}

#endif
