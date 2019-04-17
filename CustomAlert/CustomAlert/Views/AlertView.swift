//
//  AlertView.swift
//  CustomAlert
//
//  Created by Admin on 17.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol AlertDelegate {
    func leftButtonTapped()
    func rightButtonTapped()
}

class AlertView: UIView {
    private let alertWidth = 308 as CGFloat
    private let alertHeigth = 213 as CGFloat
    private let titleFontSize = 26 as CGFloat
    private let bodyFontSize = 14 as CGFloat
    private let fontType = "Arial"
    private let buttonHeight = 44 as CGFloat
    private let buttonWidth = 80 as CGFloat
    
    private var titleLabel: UILabel
    private var bodyLabel: UILabel
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var leftButton: AlertButton
    var rightButton: AlertButton
    
    var delegate: AlertDelegate?
    
    init(title: String, body: String, leftBodyTitle: String, rightBodyTitle: String) {
        self.titleLabel = UILabel()
        self.titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: fontType, size: titleFontSize)
        
        self.bodyLabel = UILabel()
        self.bodyLabel.text = body
        bodyLabel.textColor = .black
        bodyLabel.font = UIFont(name: fontType, size: bodyFontSize)
        
        self.leftButton = AlertButton()
        self.leftButton.setTitle(leftBodyTitle, for: .normal)
        self.leftButton.titleLabel?.font = UIFont(name: fontType, size: bodyFontSize)
        self.leftButton.backgroundColor = UIColor(red:0.58, green:0.60, blue:0.70, alpha:1.0)
        
        self.rightButton = AlertButton()
        self.rightButton.setTitle(rightBodyTitle, for: .normal)
        self.rightButton.titleLabel?.font = UIFont(name: fontType, size: bodyFontSize)
        self.rightButton.backgroundColor = UIColor(red:0.54, green:0.34, blue:0.67, alpha:1.0)
        
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        self.initAlertView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAlertView() {
        backgroundColor = .clear
        widthAnchor.constraint(equalToConstant: alertWidth).isActive = true
        heightAnchor.constraint(equalToConstant: alertHeigth).isActive = true
        
        clipsToBounds = true
        setupImageBackground()
        setupTitles()
        setupButtons()
    }
    
    func setupImageBackground() {
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupTitles() {
        imageView.addSubview(titleLabel)
        imageView.addSubview(bodyLabel)
        
        titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 32).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 67).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 32).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16).isActive = true
    }
    
    func setupButtons() {
        imageView.addSubview(rightButton)
        imageView.addSubview(leftButton)
        
        rightButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -24).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -24).isActive = true
        
        leftButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -24).isActive = true
        leftButton.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -8).isActive = true
        
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
    }
    
    @objc func leftButtonTapped() {
        print("left button was pressed")
        delegate?.leftButtonTapped()
    }
    
    @objc func rightButtonPressed() {
        print("right button was pressed")
        delegate?.rightButtonTapped()
    }
}
