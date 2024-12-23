//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Mithun M R on 21/11/24.
//

import UIKit
@IBDesignable
class AccountSummaryHeaderView: UIView, nibLoadable {
    @IBOutlet public weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var descriptioon: UILabel!
    @IBOutlet weak var image: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFormNib()
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFormNib()

    }
    
    func setUpView() {
        label.text = "Skull"
        descriptioon.text = "The skull is a rigid structure made of 22 bones that form the head of a vertebrate. It protects the brain and supports the structures of the face. The skull consists of the cranium, which encases the brain, and the facial bones, including the jaw and cheekbones."
    }


    @IBAction func sliderdidmove(_ slider: UISlider) {
        label.text = String(slider.value)
    }
}

