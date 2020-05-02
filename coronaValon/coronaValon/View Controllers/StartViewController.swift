//
//  ViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/11/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
   let logoImage: UIImageView = {
            var logo = UIImage(named: "logoblack")
            var logoImageView = UIImageView(image: logo)
            logoImageView.contentMode = .scaleAspectFill
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
            return logoImageView
        }()
        
        let backgroundImage: UIImageView = {
            var tiles = UIImage(named: "tiles")
            var background = UIImageView(image: tiles)
            background.contentMode = .scaleAspectFill
            background.translatesAutoresizingMaskIntoConstraints = false
            return background
        }()

        let virusImage: UIImageView = {
            var virus = UIImage(named: "blackvirus")
            var virusImageView = UIImageView(image: virus)
            virusImageView.contentMode = .scaleAspectFill
            virusImageView.translatesAutoresizingMaskIntoConstraints = false
    //        virusImageView.backgroundColor = .black
            return virusImageView
        }()
    
    let createRoomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)


        button.layer.cornerRadius = 15
        button.setTitle("Create Room", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        
        button.addTarget(self, action: #selector(createRoomButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let joinRoomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)

        button.layer.cornerRadius = 15
        button.setTitle("Join Room", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        
//        button.addTarget(self, action: #selector(joinRoomButtonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(questButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func questButtonTapped() {
        let questVoteViewController = QuestViewController()
        
        navigationController?.pushViewController(questVoteViewController, animated: true)
    }
    
    
    
    let upperContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lowerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let joinRoomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let createRoomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
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
        upperContainerView.addSubview(backgroundImage)
        upperContainerView.addSubview(logoImage)
        
        //addding elements to lowerContainerView
        lowerContainerView.addSubview(virusImage)
        lowerContainerView.addSubview(createRoomContainerView)
        lowerContainerView.addSubview(joinRoomContainerView)
        
        //adding elements to createRoomContainerView
        createRoomContainerView.addSubview(createRoomButton)
        //adding elements to joinRoomContainerView
        joinRoomContainerView.addSubview(joinRoomButton)


    }
    
    func addingConstraints() {
            //upperContainerView constraints
         upperContainerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
         upperContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         upperContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
         upperContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
         upperContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true

         //logoImage constraints
         logoImage.topAnchor.constraint(equalTo: upperContainerView.topAnchor, constant: 0).isActive = true
         logoImage.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
         logoImage.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
         logoImage.heightAnchor.constraint(equalTo: upperContainerView.heightAnchor, multiplier: 0.50).isActive = true

         
         //background constraints
             backgroundImage.topAnchor.constraint(equalTo: upperContainerView.topAnchor).isActive = true
             backgroundImage.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor).isActive = true
             backgroundImage.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor).isActive = true
             backgroundImage.heightAnchor.constraint(equalTo: upperContainerView.heightAnchor, multiplier: 1).isActive = true

         
         //lowerContainerView constraints
         lowerContainerView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 0).isActive = true
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
         joinRoomButton.topAnchor.constraint(equalTo: joinRoomContainerView.topAnchor, constant: 20).isActive = true
         
         //virusImage constraints
         virusImage.topAnchor.constraint(equalTo: lowerContainerView.centerYAnchor, constant: -100).isActive = true
         virusImage.leftAnchor.constraint(equalTo: lowerContainerView.centerXAnchor, constant: -50).isActive = true
         virusImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
         virusImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }


}

