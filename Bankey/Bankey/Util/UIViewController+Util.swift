//
//  UIViewController+Util.swift
//  Bankey
//
//  Created by Mithun M R on 19/11/24.
//

import UIKit
extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)

        statusbarView.backgroundColor = .red
        view.addSubview(statusbarView)
    }

    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
