//
//  UIFont.swift
//  SSCommon
//
//  Created by zhtg on 2023/4/26.
//

#if os(iOS)

import UIKit

@objc public extension UIFont {
    func bold() -> UIFont {
        return UIFont.boldSystemFont(ofSize: pointSize)
    }
}

@objc public extension UIFont {

    /// 34.0 SFUI-Regular
    @available(iOS 11.0, *) @objc
    static let largeTitle = UIFont.preferredFont(forTextStyle: .largeTitle)

    /// 28.0 SFUI-Regular
    @available(iOS 9.0, *) @objc
    static let title1 = UIFont.preferredFont(forTextStyle: .title1)

    /// 22.0 SFUI-Regular
    @available(iOS 9.0, *) @objc
    static let title2 = UIFont.preferredFont(forTextStyle: .title2)

    /// 20.0 SFUI-Regular
    @available(iOS 9.0, *) @objc
    static let title3 = UIFont.preferredFont(forTextStyle: .title3)

    /// 17.0    SFUI-Semibold
    @available(iOS 7.0, *) @objc
    static let headline = UIFont.preferredFont(forTextStyle: .headline)

    /// 15.0 SFUI-Regular
    @available(iOS 7.0, *) @objc
    static let subheadline = UIFont.preferredFont(forTextStyle: .subheadline)

    /// 17.0 SFUI-Regular
    @available(iOS 7.0, *) @objc
    static let body = UIFont.preferredFont(forTextStyle: .body)

    /// 16.0 SFUI-Regular
    @available(iOS 9.0, *) @objc
    static let callout = UIFont.preferredFont(forTextStyle: .callout)

    /// 13.0 SFUI-Regular
    @available(iOS 7.0, *) @objc
    static let footnote = UIFont.preferredFont(forTextStyle: .footnote)

    /// 12.0 SFUI-Regular
    @available(iOS 7.0, *) @objc
    static let caption1 = UIFont.preferredFont(forTextStyle: .caption1)

    /// 11.0 SFUI-Regular
    @available(iOS 7.0, *) @objc
    static let caption2 = UIFont.preferredFont(forTextStyle: .caption2)
}

@objc public extension UIFont {

    @objc class func PingFangSC_UltralightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Ultralight", size: size) ??
            .systemFont(ofSize: size)
    }
    @objc class func PingFangSC_SemiboldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: size) ??
            .systemFont(ofSize: size)
    }
    @objc class func PingFangSC_ThinFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Thin", size: size) ??
            .systemFont(ofSize: size)
    }
    @objc class func PingFangSC_LightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: size) ??
            .systemFont(ofSize: size)
    }
    @objc class func PingFangSC_MediumFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size) ??
            .systemFont(ofSize: size)
    }
    @objc class func PingFangSC_RegularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size) ??
            .systemFont(ofSize: size)
    }
}

#endif
