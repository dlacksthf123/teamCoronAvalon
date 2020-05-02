//
//  roleViewController.swift
//  coronaValon
//
//  Created by Isabel Daniels on 5/2/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class RoleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Role"
        addingViews()
        addingConstraints()
        view.backgroundColor = .black

    }
    
    let backgroundImage: UIImageView = {
        var tiles = UIImage(named: "blue_tiles")
        var background = UIImageView(image: tiles)
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let characterImage: UIImageView = {
        var person = UIImage(named: "nurse_man")
        switch theGame.gEnv.roles[theGame.gEnv.player] {
        case roles.analyst:
            person = UIImage(named: "analyst_woman")
        case roles.doctor:
            person = UIImage(named: "surgeon")
        case roles.virus:
            person = UIImage(named: "blackvirus")
        default:
            person = UIImage(named: "nurse_man")
        }
        var personIV = UIImageView(image: person)
        personIV.contentMode = .scaleAspectFill
        personIV.translatesAutoresizingMaskIntoConstraints = false
        return personIV
    }()
    
    let roleLabel: UILabel = {
        let label = UILabel()
        var text = "Your Role: "
        switch theGame.gEnv.roles[theGame.gEnv.player] {
        case roles.analyst:
            text = text + "Analyst"
        case roles.doctor:
            text = text + "Doctor"
        case roles.virus:
            text = text + "Virus"
        default:
            text = text + "Nurse"
        }
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.textColor = .white
        label.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let roleDescription: UITextView = {
        let label = UITextView()
        var text = ""
        switch theGame.gEnv.roles[theGame.gEnv.player] {
        case roles.analyst:
            text = "You are a hardworking analyst who knows where the viruses are.\n\nYou will help your fellow coworkers kill the virus! "
        case roles.doctor:
            text = "You are a hardworking doctor commited to fighting this pandemic.\n\nYou will help your fellow coworkers kill the virus! "
        case roles.virus:
            text = "You are a virus commited to continue the pandemic.\n\nYou sabotauge the health workers from killing the virus! "
        default:
            text = "You are a hardworking nurse commited to fighting this pandemic.\n\nYou will help your fellow coworkers kill the virus! "
        }
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)

        button.layer.cornerRadius = 15
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        return button
    }()
    
    @objc func continueButtonTapped() {
        let roleViewController = RoleViewController()
        navigationController?.pushViewController(roleViewController, animated: true)
    }
    
    func addingViews() {
        view.addSubview(backgroundImage)
        view.addSubview(roleLabel)
        view.addSubview(characterImage)
        view.addSubview(roleDescription)
        view.addSubview(continueButton)
        //        view.addSubview(upperContainerView)
        //        upperContainerView.addSubview(logoImage)
        
        //       view.addSubview(lowerContainerView)
        //       lowerContainerView.addSubview(startGameButton)
        
    }
    
    func addingConstraints() {
        
        //background constraints
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        
        //top label constraints
        roleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        roleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        roleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        roleLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.10).isActive = true
        
        //character image constraints
//        characterImage.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 10).isActive = true
        characterImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        characterImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -80).isActive = true
        characterImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        //set height equal to width so we have a square
        characterImage.heightAnchor.constraint(equalTo: characterImage.widthAnchor).isActive = true
        
        roleDescription.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        roleDescription.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -10).isActive = true
        roleDescription.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.20).isActive = true
        roleDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true

        continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 200).isActive = true

        
//        roleLabel.topAnchor.constraint(view.safeAreaLayoutGuide.topAnchor).isActive = true
        
    }
}
