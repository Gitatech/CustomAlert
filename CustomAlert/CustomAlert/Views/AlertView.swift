//
//  AlertView.swift
//  CustomAlert
//
//  Created by Admin on 17.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AlertView: UIView {
    private let alertWidth = 300 as CGFloat
    private let alertHeigth = 250 as CGFloat
    private var titleLabel: UILabel
    private var bodyLabel: UILabel
    
    init(title: String, body: String) {
        self.titleLabel = UILabel()
        self.bodyLabel = UILabel()
        self.titleLabel.text = title
        self.bodyLabel.text = body
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.initAlertView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:
    func initAlertView() {
        backgroundColor = .orange
        widthAnchor.constraint(equalToConstant: alertWidth).isActive = true
        heightAnchor.constraint(equalToConstant: alertHeigth).isActive = true
        
        clipsToBounds = true
        addSubview(titleLabel)
        addSubview(bodyLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
}
