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
    
    private let visualEffect: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.setupVisualEffectView()
    }
    

    // MARK: - manage VisualEffectView
    func setupVisualEffectView() {
        view.addSubview(visualEffect)
        visualEffect.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEffect.alpha = 0
    }
    
    func animateIn() {
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffect.alpha = 1
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffect.alpha = 0
            self.alertView.alpha = 0
            self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.alertView.removeFromSuperview()
        }
    }
    
    // MARK: - setup UIView's background
    func setupBackground() {
        self.view.addSubview(backgroundView)
        backgroundView.contentMode = .scaleToFill
        backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:47).isActive = true
    }
    
    // MARK: - manage CustomAlert
    @objc func buttonPressed() {
        print("Button was pressed")
        self.callAlert(title: "Hello", body: "World!", leftButton: "Okey", rightButton: "No")
        animateIn()
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
        animateOut()
    }
    
    func rightButtonTapped() {
        animateOut()
    }
}
