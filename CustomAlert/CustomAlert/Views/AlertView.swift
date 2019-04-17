//
//  AlertView.swift
//  CustomAlert
//
//  Created by Admin on 17.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol AlertDelegate: class {
    func leftButtonTapped()
    func rightButtonTapped()
}

class AlertView: UIView {
    private let alertWidth: CGFloat = 308
    private let alertHeigth: CGFloat = 213
    private let titleFontSize:CGFloat = 26
    private let bodyFontSize: CGFloat = 14
    private let buttonHeight: CGFloat = 44
    private let buttonWidth: CGFloat = 80
    private let fontType = "Arial"
    
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
    
    weak var delegate: AlertDelegate?
    
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
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: alertWidth),
            heightAnchor.constraint(equalToConstant: alertHeigth)
            ])
        
        clipsToBounds = true
        setupImageBackground()
        setupLabels()
        setupButtons()
    }
    
    func setupImageBackground() {
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    // MARK: - manage Labels
    func setupLabels() {
        imageView.addSubview(titleLabel)
        imageView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 32),
            bodyLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 67),
            bodyLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 32),
            imageView.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor, constant: 16)
            ])
    }
    
    // MARK: - manage Buttons
    func setupButtons() {
        imageView.addSubview(rightButton)
        imageView.addSubview(leftButton)
        
        NSLayoutConstraint.activate([
            rightButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            rightButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            imageView.bottomAnchor.constraint(equalTo: rightButton.bottomAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: rightButton.trailingAnchor, constant: 24),
            leftButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            leftButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            imageView.bottomAnchor.constraint(equalTo: leftButton.bottomAnchor, constant: 24),
            rightButton.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 8)
            ])
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
