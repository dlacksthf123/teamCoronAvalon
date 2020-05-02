//
//  LobbyViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/15/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

      override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .black
         title = "Lobby"
         addingViews()
         addingConstraints()
         customBackButton()
         // Do any additional setup after loading the view.
     }
     
     @objc func customBackButtonTapped() {
         navigationController?.popToRootViewController(animated: true)
     }
     
     func customBackButton() {
         navigationItem.hidesBackButton = true
         let backToHomeButton = UIBarButtonItem(title: "Back to the home", style: .plain, target: self, action: #selector(customBackButtonTapped))
         navigationItem.leftBarButtonItem = backToHomeButton
     }
     
     let logoImage: UIImageView = {
            var logo = UIImage(named: "logowords")
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
    
    let startGameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)

        button.layer.cornerRadius = 15
        button.setTitle("Start Game", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        
        button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        return button
    }()
    
    @objc func startGameButtonTapped() {
        let roleViewController = RoleViewController()
        navigationController?.pushViewController(roleViewController, animated: true)
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
     
     func addingConstraints() {
     
         //upperContainerView constraints
         upperContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
         upperContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
         upperContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
         upperContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.66).isActive = true
         
         //logoImage constraints
         logoImage.topAnchor.constraint(equalTo: upperContainerView.topAnchor, constant: 0).isActive = true
         logoImage.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
         logoImage.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
         logoImage.heightAnchor.constraint(equalTo: upperContainerView.heightAnchor, multiplier: 0.75).isActive = true

         
         //background constraints
         backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
         backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
         backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
         backgroundImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
        
        //lowerContainerView constraints
        lowerContainerView.topAnchor.constraint(equalTo: upperContainerView.bottomAnchor, constant: 0).isActive = true
        lowerContainerView.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
        lowerContainerView.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
        lowerContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
         
         startGameButton.centerXAnchor.constraint(equalTo: lowerContainerView.centerXAnchor, constant: 0).isActive = true
         startGameButton.centerYAnchor.constraint(equalTo: lowerContainerView.centerYAnchor, constant: 0).isActive = true
         startGameButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         startGameButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
     }
    
     
     func addingViews() {
         view.addSubview(backgroundImage)
         view.addSubview(upperContainerView)
         upperContainerView.addSubview(logoImage)
        
        view.addSubview(lowerContainerView)
        lowerContainerView.addSubview(startGameButton)

     }
}
