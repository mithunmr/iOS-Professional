//
//  UIViewController+Util.swift
//  Bankey
//
//  Created by Mithun M R on 19/11/24.
//

import UIKit
import WebKit
extension UIViewController {


    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
