//
//  ViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/11/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "CoronAvalon"
        label.font = UIFont.systemFont(ofSize: 70)
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.textColor = .yellow
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let createRoomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(createRoomButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let joinRoomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(joinRoomButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let upperContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lowerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let joinRoomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let createRoomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addingviews()
        addingConstraints()
    }
    
    @objc func createRoomButtonTapped() {
        let createRoomViewController = CreateRoomViewController()
        navigationController?.pushViewController(createRoomViewController, animated: true)
    }
    
    @objc func joinRoomButtonTapped() {
        let joinRoomViewController = JoinRoomViewController()
        
        navigationController?.pushViewController(joinRoomViewController, animated: true)
    }
    
    func addingviews() {
        
        //adding elements to the main view
        view.addSubview(upperContainerView)
        view.addSubview(lowerContainerView)
        
        
        //adding elements to the upperContainerView
        upperContainerView.addSubview(logoLabel)
        
        //addding elements to lowerContainerView
        lowerContainerView.addSubview(createRoomContainerView)
        lowerContainerView.addSubview(joinRoomContainerView)
        
        //adding elements to createRoomContainerView
        createRoomContainerView.addSubview(createRoomButton)
        //adding elements to joinRoomContainerView
        joinRoomContainerView.addSubview(joinRoomButton)


    }
    
    func addingConstraints() {
        //upperContainerView constraints
        upperContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        upperContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        upperContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        upperContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.66).isActive = true
        
        //logoLabel constraints
        logoLabel.topAnchor.constraint(equalTo: upperContainerView.topAnchor, constant: 0).isActive = true
        logoLabel.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
        logoLabel.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
        logoLabel.heightAnchor.constraint(equalTo: upperContainerView.heightAnchor, multiplier: 0.33).isActive = true
        
        //lowerContainerView constraints
        lowerContainerView.topAnchor.constraint(equalTo: upperContainerView.bottomAnchor, constant: 0).isActive = true
        lowerContainerView.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
        lowerContainerView.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
        lowerContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        //createRoomContainerView constraints
        createRoomContainerView.topAnchor.constraint(equalTo: lowerContainerView.topAnchor, constant: 0).isActive = true
        createRoomContainerView.leadingAnchor.constraint(equalTo: lowerContainerView.leadingAnchor, constant: 0).isActive = true
        createRoomContainerView.trailingAnchor.constraint(equalTo: lowerContainerView.trailingAnchor, constant: 0).isActive = true
        createRoomContainerView.heightAnchor.constraint(equalTo: lowerContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        //joinRoomContainerView constraints
        joinRoomContainerView.topAnchor.constraint(equalTo: createRoomContainerView.bottomAnchor, constant: 0).isActive = true
        joinRoomContainerView.leadingAnchor.constraint(equalTo: lowerContainerView.leadingAnchor, constant: 0).isActive = true
        joinRoomContainerView.trailingAnchor.constraint(equalTo: lowerContainerView.trailingAnchor, constant: 0).isActive = true
        joinRoomContainerView.bottomAnchor.constraint(equalTo: lowerContainerView.bottomAnchor, constant: 0).isActive = true
        
        //createRoombutton constraints
        createRoomButton.centerXAnchor.constraint(equalTo: createRoomContainerView.centerXAnchor, constant: 0).isActive = true
        createRoomButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        createRoomButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        createRoomButton.bottomAnchor.constraint(equalTo: createRoomContainerView.bottomAnchor, constant: -5).isActive = true
        //joinRoombutton constraints
        joinRoomButton.centerXAnchor.constraint(equalTo: createRoomContainerView.centerXAnchor, constant: 0).isActive = true
        joinRoomButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        joinRoomButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        joinRoomButton.topAnchor.constraint(equalTo: joinRoomContainerView.topAnchor, constant: 5).isActive = true
        
        
    }


}

