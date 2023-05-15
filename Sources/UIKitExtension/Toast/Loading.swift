//
//  Loading.swift
//  GoodMood
//
//  Created by zhtg on 2023/4/13.
//  Copyright © 2023 Buildyou Tech. All rights reserved.
//

import UIKit

private let leading = 16.0
private let space = 8.0
private let top = 12.0

public extension UIView {

    @discardableResult
    func showLoading(_ message: String = "正在加载") -> LoadingView {
        if let did = subviews.first(where: { $0 is LoadingView }) as? LoadingView {
            return did
        }
        let toast = LoadingView(message: message)
        toast.rootView = self
        toast.show()
        return toast
    }

    func hideLoading() {
        if let did = self.subviews.first(where: { $0 is LoadingView }) as? LoadingView {
            did.hide()
        }
    }
}

open class LoadingView: UIView {

    open var message: String
    open var rootView: UIView?

    @discardableResult
    public init(message: String) {
        self.message = message
        super.init(frame: .zero)
        self.rootView = UIWindow.keyWindow
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setup() {

        backgroundColor = .clear
        layer.masksToBounds = true
        layer.cornerRadius = 4

        let background = VisualView()
        addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        let activity = UIActivityIndicatorView(style: .large)
        activity.startAnimating()
        background.addSubview(activity)

        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        background.addSubview(label)

        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activity.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: activity.bottomAnchor, constant: space).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -top).isActive = true
    }

    open func show() {
        guard let rootView else {
            return
        }

        rootView.addSubview(self)

        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true

        transform = CGAffineTransformMakeScale(0.8, 0.8)
        UIView.animate(withDuration: 0.25) {
            self.transform = .identity
        }
    }

    open func hide() {
        UIView.animate(withDuration: 0.25) {
            self.transform = CGAffineTransformMakeScale(0.1, 0.1)
        } completion: { com in
            self.removeFromSuperview()
        }
    }
}
