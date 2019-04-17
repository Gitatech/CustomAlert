//
//  AlertButton.swift
//  CustomAlert
//
//  Created by Admin on 17.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

@IBDesignable // share element with Intarface Builder
class AlertButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = 22
    }
}
