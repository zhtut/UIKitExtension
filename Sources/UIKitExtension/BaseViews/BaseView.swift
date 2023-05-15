//
//  BaseView.swift
//  GoodMood
//
//  Created by zhtg on 2023/4/13.
//  Copyright © 2023 Buildyou Tech. All rights reserved.
//

import Foundation

open class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    open func setup() {

    }
}

public var windowBottomInset: CGFloat =  {
    if let window = UIWindow.keyWindow {
        return window.safeAreaInsets.bottom
    }
    return 0
}()

