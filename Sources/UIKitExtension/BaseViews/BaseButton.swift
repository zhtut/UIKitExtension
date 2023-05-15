//
//  BaseButton.swift
//  GoodMood
//
//  Created by zhtg on 2023/4/13.
//  Copyright © 2023 Buildyou Tech. All rights reserved.
//

import UIKit

open class BaseButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    open func setup() {

    }
}
