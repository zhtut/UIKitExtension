//
//  BaseTextField.swift
//  GoodMood
//
//  Created by zhtg on 2023/4/13.
//  Copyright © 2023 Buildyou Tech. All rights reserved.
//

import UIKit

open class BaseTextField: UITextField {

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
