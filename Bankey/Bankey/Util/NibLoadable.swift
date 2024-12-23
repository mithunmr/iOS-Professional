//
//  NibLoadable.swift
//  Bankey
//
//  Created by Mithun M R on 22/11/24.
//

import UIKit

protocol nibLoadable: UIView {
    var view: UIView! {get set}
    func loadViewFormNib()
}

extension nibLoadable {
    func loadViewFormNib() {
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else {
            fatalError("Bad nib name \(Self.description())")
        }
        if let defaultBundleView = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView {
            self.view = defaultBundleView
            self.view.frame = bounds
            self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(self.view)
            print(nibName,"is loaded from nib")

        } else {
            fatalError("Cannot load view from bundle")
        }
    }
}
