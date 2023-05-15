//
//  Toast.swift
//  Toast
//
//  Created by shutut on 2023/4/13.
//

import UIKit

private let leading = 16.0
private let top = 12.0

@discardableResult
public func toast(_ message: String, position: Toast.Position = .center) -> Toast {
    if let keyWindow = UIWindow.keyWindow {
        return keyWindow.toast(message, position: position)
    } else {
        return Toast(message: message)
    }
}

public func hideToast(animated: Bool) {
    if let keyWindow = UIWindow.keyWindow {
        return keyWindow.hideToast(animated: animated)
    }
}

public extension UIView {

    @discardableResult
    func toast(_ message: String, position: Toast.Position = .center) -> Toast {
        hideToast(animated: false)
        let toast = Toast(message: message)
        toast.rootView = self
        toast.position = position
        toast.show(animated: true)
        return toast
    }

    func hideToast(animated: Bool) {
        if let did = self.subviews.first(where: { $0 is Toast }) as? Toast {
            did.hide(animated: animated)
        }
    }
}

open class Toast: UIView {
    
    public enum Position {
        case center
        case top
        case bottom
    }
    
    open var message: String
    open var rootView: UIView?
    open var position: Position = .center
    
    @discardableResult
    fileprivate init(message: String) {
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
        
        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        background.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -top).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.removeFromSuperview()
        }
    }

    open func show(animated: Bool) {
        guard let rootView else {
            return
        }

        rootView.addSubview(self)

        translatesAutoresizingMaskIntoConstraints = false
        switch position {
        case .center:
            centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        case .top:
            centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalToSystemSpacingBelow: rootView.bottomAnchor, multiplier: 0.33).isActive = true
        case .bottom:
            centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalToSystemSpacingBelow: rootView.bottomAnchor, multiplier: 0.66).isActive = true
        }
        widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true

        if animated {
            transform = CGAffineTransformMakeScale(0.8, 0.8)
            UIView.animate(withDuration: 0.25) {
                self.transform = .identity
            }
        }
    }

    open func hide(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.alpha = 0.0
            } completion: { com in
                self.removeFromSuperview()
            }
        } else {
            self.removeFromSuperview()
        }
    }
}
