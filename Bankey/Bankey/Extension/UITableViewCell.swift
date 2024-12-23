//
//  UITableViewCell.swift
//  Bankey
//
//  Created by Mithun M R on 22/11/24.
//

import UIKit


extension UITableViewCell {
    static  var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nib:UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
