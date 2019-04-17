//
//  ViewController.swift
//  CustomAlert
//
//  Created by Admin on 17.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let buttonSize = 52.0 as CGFloat
    private lazy var alertView: AlertView = {
        let alert = AlertView(title: "", body: "", leftBodyTitle: "", rightBodyTitle: "")
        alert.delegate = self
        return alert
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background-Feed")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackground()
        self.setupAddButton()
    }
    
    // MARK: - setup background
    func setupBackground() {
        self.view.addSubview(backgroundView)
        backgroundView.contentMode = .scaleToFill
        backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:47).isActive = true
    }
    
    // MARK: - manage custom alert
    @objc func buttonPressed() {
        print("Button was pressed")
        self.callAlert(title: "Hello", body: "World!", leftButton: "Okey", rightButton: "No")
    }
    
    func setupAddButton() {
        self.view.addSubview(addButton)
        addButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17).isActive = true
        addButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func callAlert(title: String, body: String, leftButton: String, rightButton: String) {
        alertView = AlertView(title: title, body: body, leftBodyTitle: leftButton, rightBodyTitle: rightButton)
        view.addSubview(alertView)
        alertView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        alertView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
    }
}

extension ViewController: AlertDelegate {
    func leftButtonTapped() {
        self.alertView.removeFromSuperview()
    }
    
    func rightButtonTapped() {
        print("right button was tapped")
    }
}
