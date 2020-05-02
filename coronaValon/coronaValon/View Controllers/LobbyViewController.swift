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
     
     let upperContainerView: UIView = {
         let view = UIView()
         view.backgroundColor = .none
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     func addingConstraints() {
     
         //upperContainerView constraints
         upperContainerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
         upperContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
         upperContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
         upperContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
         upperContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true

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
     }
     
     func addingViews() {
         view.addSubview(backgroundImage)
         view.addSubview(upperContainerView)
         upperContainerView.addSubview(logoImage)
     }
}
