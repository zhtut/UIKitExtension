//
//  ContentView.swift
//  GoodMood
//
//  Created by zhtg on 2023/4/13.
//  Copyright © 2023 Buildyou Tech. All rights reserved.
//

import Foundation

open class VisualView: UIView {

    open var contentView: UIView!

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setup () {

        var blurStyle: UIBlurEffect.Style
        let style = UITraitCollection.current.userInterfaceStyle
        switch style {
        case .dark:
            blurStyle = .dark
        case.light:
            blurStyle = .dark
        case .unspecified:
            blurStyle = .light
        @unknown default:
            blurStyle = .light
        }
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
        addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        let vibrancyEffectView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: UIBlurEffect(style: .dark)))
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        vibrancyEffectView.translatesAutoresizingMaskIntoConstraints = false
        vibrancyEffectView.leadingAnchor.constraint(equalTo: blurEffectView.contentView.leadingAnchor).isActive = true
        vibrancyEffectView.trailingAnchor.constraint(equalTo: blurEffectView.contentView.trailingAnchor).isActive = true
        vibrancyEffectView.topAnchor.constraint(equalTo: blurEffectView.contentView.topAnchor).isActive = true
        vibrancyEffectView.bottomAnchor.constraint(equalTo: blurEffectView.contentView.bottomAnchor).isActive = true

        contentView = vibrancyEffectView.contentView
    }
}
