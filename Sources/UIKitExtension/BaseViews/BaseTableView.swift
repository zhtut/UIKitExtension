//
//  BaseTableView.swift
//  GoodMood
//
//  Created by zhtg on 2023/5/6.
//  Copyright © 2023 Buildyou Tech. All rights reserved.
//

import UIKit

open class BaseTableView: UITableView {

    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    open func setup() {
        separatorColor = .systemGray5
    }
}
