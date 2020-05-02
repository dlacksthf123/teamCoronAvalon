//
//  MainGameViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 5/2/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class MainGameViewController: UIViewController {
    
    var numPart = 5
    
    let name1: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name2: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name3: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name4: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name5: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name6: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name7: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name8: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name9: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name10: UILabel = {
        var label = UILabel()
        label.text = "Chansolsssssssssssssssssssssss"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questLabel1: UILabel = {
        var label = UILabel()
        label.text = "Quest 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let questNumLabel1: UILabel = {
        var label = UILabel()
        label.text = "3"
        label.font = label.font.withSize(90)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questLabel2: UILabel = {
        var label = UILabel()
        label.text = "Quest 2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let questNumLabel2: UILabel = {
        var label = UILabel()
        label.text = "4"
        label.font = label.font.withSize(90)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questLabel3: UILabel = {
        var label = UILabel()
        label.text = "Quest 3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let questNumLabel3: UILabel = {
        var label = UILabel()
        label.text = "4"
        label.font = label.font.withSize(90)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questLabel4: UILabel = {
        var label = UILabel()
        label.text = "Quest 4"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let questNumLabel4: UILabel = {
        var label = UILabel()
        label.text = "5"
        label.font = label.font.withSize(90)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questLabel5: UILabel = {
        var label = UILabel()
        label.text = "Quest 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let questNumLabel5: UILabel = {
        var label = UILabel()
        label.text = "5"
        label.font = label.font.withSize(90)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundImageView: UIImageView = {
        var backgroundImage = UIImage(named: "grocerystoreart")
        var backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    let questStackViewContainerView: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 35
        view.layer.masksToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let questStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.distribution  = .fillEqually
        stackView.alignment = .center
        stackView.spacing   = 16.0
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let questView1: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 50;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let questView2: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 50;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let questView3: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 50;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let questView4: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 50;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let questView5: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 50;
        view.layer.masksToBounds = true;
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let topViewContainerView: UIView = {
        var view = UIView()
//        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let topPlayersStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        stackView.distribution  = .equalCentering
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        stackView.isLayoutMarginsRelativeArrangement = true
//           stackView.spacing   = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let player1: UIButton = {
        var button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    let player2: UIButton = {
        var button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    let player3: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    let player4: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let player5: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let player6: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let player7: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let player8: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let player9: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let player10: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 50;
        button.layer.masksToBounds = true;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let bottomViewContainerView: UIView = {
        var view = UIView()
//        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let bottomPlayersStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        stackView.distribution  = .equalCentering
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        stackView.isLayoutMarginsRelativeArrangement = true
//           stackView.spacing   = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()

        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .landscape
        }
    }
    
    func addViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(questStackViewContainerView)
        view.addSubview(topViewContainerView)
        view.addSubview(bottomViewContainerView)
        questStackViewContainerView.addSubview(questStackView)
        questStackView.addArrangedSubview(questView1)
        questStackView.addArrangedSubview(questView2)
        questStackView.addArrangedSubview(questView3)
        questStackView.addArrangedSubview(questView4)
        questStackView.addArrangedSubview(questView5)
        questStackView.frame = questStackViewContainerView.bounds
        
        questView1.addSubview(questLabel1)
        questView1.addSubview(questNumLabel1)
        
        questView2.addSubview(questLabel2)
        questView2.addSubview(questNumLabel2)
        
        questView3.addSubview(questLabel3)
        questView3.addSubview(questNumLabel3)
        
        questView4.addSubview(questLabel4)
        questView4.addSubview(questNumLabel4)
        
        questView5.addSubview(questLabel5)
        questView5.addSubview(questNumLabel5)

        //5 players
        switch numPart {
        case 5:
            topViewContainerView.addSubview(topPlayersStackView)
            topPlayersStackView.addArrangedSubview(player1)
            topViewContainerView.addSubview(name1)
            topPlayersStackView.addArrangedSubview(player2)
            topViewContainerView.addSubview(name2)
            topPlayersStackView.addArrangedSubview(player3)
            topViewContainerView.addSubview(name3)
            
            bottomViewContainerView.addSubview(bottomPlayersStackView)
            bottomPlayersStackView.addArrangedSubview(player4)
            bottomViewContainerView.addSubview(name4)
            bottomPlayersStackView.addArrangedSubview(player5)
            bottomViewContainerView.addSubview(name5)
            
        case 6:
            topViewContainerView.addSubview(topPlayersStackView)
            topPlayersStackView.addArrangedSubview(player1)
            topViewContainerView.addSubview(name1)
            topPlayersStackView.addArrangedSubview(player2)
            topViewContainerView.addSubview(name2)
            topPlayersStackView.addArrangedSubview(player3)
            topViewContainerView.addSubview(name3)
            
            bottomViewContainerView.addSubview(bottomPlayersStackView)
            bottomPlayersStackView.addArrangedSubview(player4)
            bottomViewContainerView.addSubview(name4)
            bottomPlayersStackView.addArrangedSubview(player5)
            bottomViewContainerView.addSubview(name5)
            bottomPlayersStackView.addArrangedSubview(player6)
            bottomViewContainerView.addSubview(name6)
        case 7:
            topViewContainerView.addSubview(topPlayersStackView)
            topPlayersStackView.addArrangedSubview(player1)
            topViewContainerView.addSubview(name1)
            topPlayersStackView.addArrangedSubview(player2)
            topViewContainerView.addSubview(name2)
            topPlayersStackView.addArrangedSubview(player3)
            topViewContainerView.addSubview(name3)
            topPlayersStackView.addArrangedSubview(player4)
            topViewContainerView.addSubview(name4)
            
            bottomViewContainerView.addSubview(bottomPlayersStackView)
            bottomPlayersStackView.addArrangedSubview(player5)
            bottomViewContainerView.addSubview(name5)
            bottomPlayersStackView.addArrangedSubview(player6)
            bottomViewContainerView.addSubview(name6)
            bottomPlayersStackView.addArrangedSubview(player7)
           bottomViewContainerView.addSubview(name7)
        case 8:
             topViewContainerView.addSubview(topPlayersStackView)
             topPlayersStackView.addArrangedSubview(player1)
             topViewContainerView.addSubview(name1)
             topPlayersStackView.addArrangedSubview(player2)
             topViewContainerView.addSubview(name2)
             topPlayersStackView.addArrangedSubview(player3)
             topViewContainerView.addSubview(name3)
             topPlayersStackView.addArrangedSubview(player4)
             topViewContainerView.addSubview(name4)
             
             bottomViewContainerView.addSubview(bottomPlayersStackView)
             bottomPlayersStackView.addArrangedSubview(player5)
             bottomViewContainerView.addSubview(name5)
             bottomPlayersStackView.addArrangedSubview(player6)
             bottomViewContainerView.addSubview(name6)
             bottomPlayersStackView.addArrangedSubview(player7)
            bottomViewContainerView.addSubview(name7)
             bottomPlayersStackView.addArrangedSubview(player8)
            bottomViewContainerView.addSubview(name8)
        case 9:
            topViewContainerView.addSubview(topPlayersStackView)
            topPlayersStackView.addArrangedSubview(player1)
            topViewContainerView.addSubview(name1)
            topPlayersStackView.addArrangedSubview(player2)
            topViewContainerView.addSubview(name2)
            topPlayersStackView.addArrangedSubview(player3)
            topViewContainerView.addSubview(name3)
            topPlayersStackView.addArrangedSubview(player4)
            topViewContainerView.addSubview(name4)
            topPlayersStackView.addArrangedSubview(player5)
            topViewContainerView.addSubview(name5)
            
            bottomViewContainerView.addSubview(bottomPlayersStackView)
             bottomPlayersStackView.addArrangedSubview(player6)
             bottomViewContainerView.addSubview(name6)
             bottomPlayersStackView.addArrangedSubview(player7)
            bottomViewContainerView.addSubview(name7)
             bottomPlayersStackView.addArrangedSubview(player8)
            bottomViewContainerView.addSubview(name8)
            bottomPlayersStackView.addArrangedSubview(player9)
            bottomViewContainerView.addSubview(name9)
        case 10:
            topViewContainerView.addSubview(topPlayersStackView)
            topPlayersStackView.addArrangedSubview(player1)
            topViewContainerView.addSubview(name1)
            topPlayersStackView.addArrangedSubview(player2)
            topViewContainerView.addSubview(name2)
            topPlayersStackView.addArrangedSubview(player3)
            topViewContainerView.addSubview(name3)
            topPlayersStackView.addArrangedSubview(player4)
            topViewContainerView.addSubview(name4)
            topPlayersStackView.addArrangedSubview(player5)
            topViewContainerView.addSubview(name5)
            
            bottomViewContainerView.addSubview(bottomPlayersStackView)
             bottomPlayersStackView.addArrangedSubview(player6)
             bottomViewContainerView.addSubview(name6)
             bottomPlayersStackView.addArrangedSubview(player7)
            bottomViewContainerView.addSubview(name7)
             bottomPlayersStackView.addArrangedSubview(player8)
            bottomViewContainerView.addSubview(name8)
            bottomPlayersStackView.addArrangedSubview(player9)
            bottomViewContainerView.addSubview(name9)
            bottomPlayersStackView.addArrangedSubview(player10)
            bottomViewContainerView.addSubview(name10)
            
        default:
            print("Error")
        }        
    }
    
    func addConstraints() {
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        
        
        questStackViewContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        questStackViewContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        questStackViewContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        questStackViewContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        topViewContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topViewContainerView.bottomAnchor.constraint(equalTo: questStackViewContainerView.topAnchor, constant: 30).isActive = true
        topViewContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topViewContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        bottomViewContainerView.topAnchor.constraint(equalTo: questStackViewContainerView.bottomAnchor, constant: -10).isActive = true
        bottomViewContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        bottomViewContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomViewContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        questView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questView1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        questView1.centerYAnchor.constraint(equalTo: questStackViewContainerView.centerYAnchor, constant: 0).isActive = true
        
        questView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questView2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        questView2.centerYAnchor.constraint(equalTo: questStackViewContainerView.centerYAnchor, constant: 0).isActive = true
        
        questView3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questView3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        questView3.centerYAnchor.constraint(equalTo: questStackViewContainerView.centerYAnchor, constant: 0).isActive = true
        
        questView4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questView4.heightAnchor.constraint(equalToConstant: 100).isActive = true
        questView4.centerYAnchor.constraint(equalTo: questStackViewContainerView.centerYAnchor, constant: 0).isActive = true
        
        questView5.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questView5.heightAnchor.constraint(equalToConstant: 100).isActive = true
        questView5.centerYAnchor.constraint(equalTo: questStackViewContainerView.centerYAnchor, constant: 0).isActive = true
        
        questLabel1.topAnchor.constraint(equalTo: questView1.topAnchor, constant: 10).isActive = true
        questLabel1.centerXAnchor.constraint(equalTo: questView1.centerXAnchor, constant: 4).isActive = true
        questLabel1.widthAnchor.constraint(equalTo: questView1.widthAnchor, multiplier: 0.7).isActive = true
        questLabel1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        questNumLabel1.centerXAnchor.constraint(equalTo: questView1.centerXAnchor, constant: -2).isActive = true
        questNumLabel1.topAnchor.constraint(equalTo: questLabel1.bottomAnchor, constant: 0).isActive = true
        questNumLabel1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        questNumLabel1.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        questLabel2.topAnchor.constraint(equalTo: questView2.topAnchor, constant: 10).isActive = true
        questLabel2.centerXAnchor.constraint(equalTo: questView2.centerXAnchor, constant: 4).isActive = true
        questLabel2.widthAnchor.constraint(equalTo: questView2.widthAnchor, multiplier: 0.7).isActive = true
        questLabel2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        questNumLabel2.centerXAnchor.constraint(equalTo: questView2.centerXAnchor, constant: -5).isActive = true
        questNumLabel2.topAnchor.constraint(equalTo: questLabel2.bottomAnchor, constant: 0).isActive = true
        questNumLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        questNumLabel2.heightAnchor.constraint(equalToConstant: 70).isActive = true

        
        questLabel3.topAnchor.constraint(equalTo: questView3.topAnchor, constant: 10).isActive = true
        questLabel3.centerXAnchor.constraint(equalTo: questView3.centerXAnchor, constant: 4).isActive = true
        questLabel3.widthAnchor.constraint(equalTo: questView3.widthAnchor, multiplier: 0.7).isActive = true
        questLabel3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        questNumLabel3.centerXAnchor.constraint(equalTo: questView3.centerXAnchor, constant: -5).isActive = true
        questNumLabel3.topAnchor.constraint(equalTo: questLabel3.bottomAnchor, constant: 0).isActive = true
        questNumLabel3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        questNumLabel3.heightAnchor.constraint(equalToConstant: 70).isActive = true

        
        questLabel4.topAnchor.constraint(equalTo: questView4.topAnchor, constant: 10).isActive = true
        questLabel4.centerXAnchor.constraint(equalTo: questView4.centerXAnchor, constant: 4).isActive = true
        questLabel4.widthAnchor.constraint(equalTo: questView4.widthAnchor, multiplier: 0.7).isActive = true
        questLabel4.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        questNumLabel4.centerXAnchor.constraint(equalTo: questView4.centerXAnchor, constant: -2).isActive = true
        questNumLabel4.topAnchor.constraint(equalTo: questLabel4.bottomAnchor, constant: 0).isActive = true
        questNumLabel4.widthAnchor.constraint(equalToConstant: 50).isActive = true
        questNumLabel4.heightAnchor.constraint(equalToConstant: 70).isActive = true

        
        questLabel5.topAnchor.constraint(equalTo: questView5.topAnchor, constant: 10).isActive = true
        questLabel5.centerXAnchor.constraint(equalTo: questView5.centerXAnchor, constant: 4).isActive = true
        questLabel5.widthAnchor.constraint(equalTo: questView5.widthAnchor, multiplier: 0.7).isActive = true
        questLabel5.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        questNumLabel5.centerXAnchor.constraint(equalTo: questView5.centerXAnchor, constant: -2).isActive = true
        questNumLabel5.topAnchor.constraint(equalTo: questLabel5.bottomAnchor, constant: 0).isActive = true
        questNumLabel5.widthAnchor.constraint(equalToConstant: 50).isActive = true
        questNumLabel5.heightAnchor.constraint(equalToConstant: 70).isActive = true

        
        
        
        switch numPart {
        case 5:
            topPlayersStackView.topAnchor.constraint(equalTo: topViewContainerView.topAnchor, constant: 0).isActive = true
            topPlayersStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: 0).isActive = true
            topPlayersStackView.leadingAnchor.constraint(equalTo: topViewContainerView.leadingAnchor, constant: 0).isActive = true
            topPlayersStackView.trailingAnchor.constraint(equalTo: topViewContainerView.trailingAnchor, constant: 0).isActive = true
            
            player1.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player1.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name1.bottomAnchor.constraint(equalTo: player1.topAnchor, constant: -10).isActive = true
            name1.centerXAnchor.constraint(equalTo: player1.centerXAnchor, constant: 0).isActive = true
            name1.widthAnchor.constraint(equalTo: player1.widthAnchor, multiplier:1.2).isActive = true
            
            
            
            player2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name2.bottomAnchor.constraint(equalTo: player2.topAnchor, constant: -10).isActive = true
            name2.centerXAnchor.constraint(equalTo: player2.centerXAnchor, constant: 0).isActive = true
            name2.widthAnchor.constraint(equalTo: player2.widthAnchor, multiplier:1.2).isActive = true
             
            
            player3.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player3.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name3.bottomAnchor.constraint(equalTo: player3.topAnchor, constant: -10).isActive = true
            name3.centerXAnchor.constraint(equalTo: player3.centerXAnchor, constant: 0).isActive = true
            name3.widthAnchor.constraint(equalTo: player3.widthAnchor, multiplier:1.2).isActive = true
            
            bottomPlayersStackView.topAnchor.constraint(equalTo: bottomViewContainerView.topAnchor, constant: 0).isActive = true
            bottomPlayersStackView.bottomAnchor.constraint(equalTo: bottomViewContainerView.bottomAnchor, constant: 0).isActive = true
            bottomPlayersStackView.leadingAnchor.constraint(equalTo: bottomViewContainerView.leadingAnchor, constant: 0).isActive = true
            bottomPlayersStackView.trailingAnchor.constraint(equalTo: bottomViewContainerView.trailingAnchor, constant: 0).isActive = true
            
            player4.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player4.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name4.topAnchor.constraint(equalTo: player4.bottomAnchor, constant: 0).isActive = true
            name4.centerXAnchor.constraint(equalTo: player4.centerXAnchor, constant: 0).isActive = true
            name4.widthAnchor.constraint(equalTo: player4.widthAnchor, multiplier:1.2).isActive = true
            
            
            player5.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player5.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name5.topAnchor.constraint(equalTo: player5.bottomAnchor, constant: 0).isActive = true
            name5.centerXAnchor.constraint(equalTo: player5.centerXAnchor, constant: 0).isActive = true
            name5.widthAnchor.constraint(equalTo: player5.widthAnchor, multiplier:1.2).isActive = true
        case 6:
            topPlayersStackView.topAnchor.constraint(equalTo: topViewContainerView.topAnchor, constant: 0).isActive = true
            topPlayersStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: 0).isActive = true
            topPlayersStackView.leadingAnchor.constraint(equalTo: topViewContainerView.leadingAnchor, constant: 0).isActive = true
            topPlayersStackView.trailingAnchor.constraint(equalTo: topViewContainerView.trailingAnchor, constant: 0).isActive = true
            
            player1.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player1.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name1.bottomAnchor.constraint(equalTo: player1.topAnchor, constant: -10).isActive = true
            name1.centerXAnchor.constraint(equalTo: player1.centerXAnchor, constant: 0).isActive = true
            name1.widthAnchor.constraint(equalTo: player1.widthAnchor, multiplier:1.2).isActive = true
            
            
            player2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name2.bottomAnchor.constraint(equalTo: player2.topAnchor, constant: -10).isActive = true
            name2.centerXAnchor.constraint(equalTo: player2.centerXAnchor, constant: 0).isActive = true
            name2.widthAnchor.constraint(equalTo: player2.widthAnchor, multiplier:1.2).isActive = true
             
            
            player3.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player3.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name3.bottomAnchor.constraint(equalTo: player3.topAnchor, constant: -10).isActive = true
            name3.centerXAnchor.constraint(equalTo: player3.centerXAnchor, constant: 0).isActive = true
            name3.widthAnchor.constraint(equalTo: player3.widthAnchor, multiplier:1.2).isActive = true
            
            bottomPlayersStackView.topAnchor.constraint(equalTo: bottomViewContainerView.topAnchor, constant: 0).isActive = true
            bottomPlayersStackView.bottomAnchor.constraint(equalTo: bottomViewContainerView.bottomAnchor, constant: 0).isActive = true
            bottomPlayersStackView.leadingAnchor.constraint(equalTo: bottomViewContainerView.leadingAnchor, constant: 0).isActive = true
            bottomPlayersStackView.trailingAnchor.constraint(equalTo: bottomViewContainerView.trailingAnchor, constant: 0).isActive = true
            
            player4.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player4.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name4.topAnchor.constraint(equalTo: player4.bottomAnchor, constant: 0).isActive = true
            name4.centerXAnchor.constraint(equalTo: player4.centerXAnchor, constant: 0).isActive = true
            name4.widthAnchor.constraint(equalTo: player4.widthAnchor, multiplier:1.2).isActive = true
            
            
            player5.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player5.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name5.topAnchor.constraint(equalTo: player5.bottomAnchor, constant: 0).isActive = true
            name5.centerXAnchor.constraint(equalTo: player5.centerXAnchor, constant: 0).isActive = true
            name5.widthAnchor.constraint(equalTo: player5.widthAnchor, multiplier:1.2).isActive = true
             
             
            player6.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player6.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name6.topAnchor.constraint(equalTo: player6.bottomAnchor, constant: 0).isActive = true
            name6.centerXAnchor.constraint(equalTo: player6.centerXAnchor, constant: 0).isActive = true
            name6.widthAnchor.constraint(equalTo: player6.widthAnchor, multiplier:1.2).isActive = true
        case 7:
            topPlayersStackView.topAnchor.constraint(equalTo: topViewContainerView.topAnchor, constant: 0).isActive = true
            topPlayersStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: 0).isActive = true
            topPlayersStackView.leadingAnchor.constraint(equalTo: topViewContainerView.leadingAnchor, constant: 0).isActive = true
            topPlayersStackView.trailingAnchor.constraint(equalTo: topViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player1.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player1.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name1.bottomAnchor.constraint(equalTo: player1.topAnchor, constant: -10).isActive = true
            name1.centerXAnchor.constraint(equalTo: player1.centerXAnchor, constant: 0).isActive = true
            name1.widthAnchor.constraint(equalTo: player1.widthAnchor, multiplier:1.2).isActive = true
             
             
            player2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name2.bottomAnchor.constraint(equalTo: player2.topAnchor, constant: -10).isActive = true
            name2.centerXAnchor.constraint(equalTo: player2.centerXAnchor, constant: 0).isActive = true
            name2.widthAnchor.constraint(equalTo: player2.widthAnchor, multiplier:1.2).isActive = true
              
             
            player3.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player3.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name3.bottomAnchor.constraint(equalTo: player3.topAnchor, constant: -10).isActive = true
            name3.centerXAnchor.constraint(equalTo: player3.centerXAnchor, constant: 0).isActive = true
            name3.widthAnchor.constraint(equalTo: player3.widthAnchor, multiplier:1.2).isActive = true
            
            player4.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player4.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name4.bottomAnchor.constraint(equalTo: player4.topAnchor, constant: -10).isActive = true
            name4.centerXAnchor.constraint(equalTo: player4.centerXAnchor, constant: 0).isActive = true
            name4.widthAnchor.constraint(equalTo: player4.widthAnchor, multiplier:1.2).isActive = true
             
            bottomPlayersStackView.topAnchor.constraint(equalTo: bottomViewContainerView.topAnchor, constant: 0).isActive = true
            bottomPlayersStackView.bottomAnchor.constraint(equalTo: bottomViewContainerView.bottomAnchor, constant: 0).isActive = true
            bottomPlayersStackView.leadingAnchor.constraint(equalTo: bottomViewContainerView.leadingAnchor, constant: 0).isActive = true
            bottomPlayersStackView.trailingAnchor.constraint(equalTo: bottomViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player5.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player5.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name5.topAnchor.constraint(equalTo: player5.bottomAnchor, constant: 0).isActive = true
            name5.centerXAnchor.constraint(equalTo: player5.centerXAnchor, constant: 0).isActive = true
            name5.widthAnchor.constraint(equalTo: player5.widthAnchor, multiplier:1.2).isActive = true
             
             
            player6.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player6.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name6.topAnchor.constraint(equalTo: player6.bottomAnchor, constant: 0).isActive = true
            name6.centerXAnchor.constraint(equalTo: player6.centerXAnchor, constant: 0).isActive = true
            name6.widthAnchor.constraint(equalTo: player6.widthAnchor, multiplier:1.2).isActive = true
             
             
            player7.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player7.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name7.topAnchor.constraint(equalTo: player7.bottomAnchor, constant: 0).isActive = true
            name7.centerXAnchor.constraint(equalTo: player7.centerXAnchor, constant: 0).isActive = true
            name7.widthAnchor.constraint(equalTo: player7.widthAnchor, multiplier:1.2).isActive = true
        
        case 8:
            topPlayersStackView.topAnchor.constraint(equalTo: topViewContainerView.topAnchor, constant: 0).isActive = true
            topPlayersStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: 0).isActive = true
            topPlayersStackView.leadingAnchor.constraint(equalTo: topViewContainerView.leadingAnchor, constant: 0).isActive = true
            topPlayersStackView.trailingAnchor.constraint(equalTo: topViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player1.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player1.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name1.bottomAnchor.constraint(equalTo: player1.topAnchor, constant: -10).isActive = true
            name1.centerXAnchor.constraint(equalTo: player1.centerXAnchor, constant: 0).isActive = true
            name1.widthAnchor.constraint(equalTo: player1.widthAnchor, multiplier:1.2).isActive = true
             
             
            player2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name2.bottomAnchor.constraint(equalTo: player2.topAnchor, constant: -10).isActive = true
            name2.centerXAnchor.constraint(equalTo: player2.centerXAnchor, constant: 0).isActive = true
            name2.widthAnchor.constraint(equalTo: player2.widthAnchor, multiplier:1.2).isActive = true
              
             
            player3.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player3.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name3.bottomAnchor.constraint(equalTo: player3.topAnchor, constant: -10).isActive = true
            name3.centerXAnchor.constraint(equalTo: player3.centerXAnchor, constant: 0).isActive = true
            name3.widthAnchor.constraint(equalTo: player3.widthAnchor, multiplier:1.2).isActive = true
            
            player4.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player4.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name4.bottomAnchor.constraint(equalTo: player4.topAnchor, constant: -10).isActive = true
            name4.centerXAnchor.constraint(equalTo: player4.centerXAnchor, constant: 0).isActive = true
            name4.widthAnchor.constraint(equalTo: player4.widthAnchor, multiplier:1.2).isActive = true
             
            bottomPlayersStackView.topAnchor.constraint(equalTo: bottomViewContainerView.topAnchor, constant: 0).isActive = true
            bottomPlayersStackView.bottomAnchor.constraint(equalTo: bottomViewContainerView.bottomAnchor, constant: 0).isActive = true
            bottomPlayersStackView.leadingAnchor.constraint(equalTo: bottomViewContainerView.leadingAnchor, constant: 0).isActive = true
            bottomPlayersStackView.trailingAnchor.constraint(equalTo: bottomViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player5.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player5.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name5.topAnchor.constraint(equalTo: player5.bottomAnchor, constant: 0).isActive = true
            name5.centerXAnchor.constraint(equalTo: player5.centerXAnchor, constant: 0).isActive = true
            name5.widthAnchor.constraint(equalTo: player5.widthAnchor, multiplier:1.2).isActive = true
             
             
            player6.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player6.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name6.topAnchor.constraint(equalTo: player6.bottomAnchor, constant: 0).isActive = true
            name6.centerXAnchor.constraint(equalTo: player6.centerXAnchor, constant: 0).isActive = true
            name6.widthAnchor.constraint(equalTo: player6.widthAnchor, multiplier:1.2).isActive = true
             
             
            player7.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player7.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name7.topAnchor.constraint(equalTo: player7.bottomAnchor, constant: 0).isActive = true
            name7.centerXAnchor.constraint(equalTo: player7.centerXAnchor, constant: 0).isActive = true
            name7.widthAnchor.constraint(equalTo: player7.widthAnchor, multiplier:1.2).isActive = true
             
            player8.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player8.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name8.topAnchor.constraint(equalTo: player8.bottomAnchor, constant: 0).isActive = true
            name8.centerXAnchor.constraint(equalTo: player8.centerXAnchor, constant: 0).isActive = true
            name8.widthAnchor.constraint(equalTo: player8.widthAnchor, multiplier:1.2).isActive = true
        case 9:
            topPlayersStackView.topAnchor.constraint(equalTo: topViewContainerView.topAnchor, constant: 0).isActive = true
            topPlayersStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: 0).isActive = true
            topPlayersStackView.leadingAnchor.constraint(equalTo: topViewContainerView.leadingAnchor, constant: 0).isActive = true
            topPlayersStackView.trailingAnchor.constraint(equalTo: topViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player1.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player1.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name1.bottomAnchor.constraint(equalTo: player1.topAnchor, constant: -10).isActive = true
            name1.centerXAnchor.constraint(equalTo: player1.centerXAnchor, constant: 0).isActive = true
            name1.widthAnchor.constraint(equalTo: player1.widthAnchor, multiplier:1.2).isActive = true
             
             
            player2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name2.bottomAnchor.constraint(equalTo: player2.topAnchor, constant: -10).isActive = true
            name2.centerXAnchor.constraint(equalTo: player2.centerXAnchor, constant: 0).isActive = true
            name2.widthAnchor.constraint(equalTo: player2.widthAnchor, multiplier:1.2).isActive = true
              
             
            player3.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player3.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name3.bottomAnchor.constraint(equalTo: player3.topAnchor, constant: -10).isActive = true
            name3.centerXAnchor.constraint(equalTo: player3.centerXAnchor, constant: 0).isActive = true
            name3.widthAnchor.constraint(equalTo: player3.widthAnchor, multiplier:1.2).isActive = true
            
            player4.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player4.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name4.bottomAnchor.constraint(equalTo: player4.topAnchor, constant: -10).isActive = true
            name4.centerXAnchor.constraint(equalTo: player4.centerXAnchor, constant: 0).isActive = true
            name4.widthAnchor.constraint(equalTo: player4.widthAnchor, multiplier:1.2).isActive = true
            
            player5.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player5.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name5.bottomAnchor.constraint(equalTo: player5.topAnchor, constant: -10).isActive = true
            name5.centerXAnchor.constraint(equalTo: player5.centerXAnchor, constant: 0).isActive = true
            name5.widthAnchor.constraint(equalTo: player5.widthAnchor, multiplier:1.2).isActive = true
             
            bottomPlayersStackView.topAnchor.constraint(equalTo: bottomViewContainerView.topAnchor, constant: 0).isActive = true
            bottomPlayersStackView.bottomAnchor.constraint(equalTo: bottomViewContainerView.bottomAnchor, constant: 0).isActive = true
            bottomPlayersStackView.leadingAnchor.constraint(equalTo: bottomViewContainerView.leadingAnchor, constant: 0).isActive = true
            bottomPlayersStackView.trailingAnchor.constraint(equalTo: bottomViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player6.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player6.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name6.topAnchor.constraint(equalTo: player6.bottomAnchor, constant: 0).isActive = true
            name6.centerXAnchor.constraint(equalTo: player6.centerXAnchor, constant: 0).isActive = true
            name6.widthAnchor.constraint(equalTo: player6.widthAnchor, multiplier:1.2).isActive = true
             
             
            player7.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player7.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name7.topAnchor.constraint(equalTo: player7.bottomAnchor, constant: 0).isActive = true
            name7.centerXAnchor.constraint(equalTo: player7.centerXAnchor, constant: 0).isActive = true
            name7.widthAnchor.constraint(equalTo: player7.widthAnchor, multiplier:1.2).isActive = true
             
            player8.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player8.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name8.topAnchor.constraint(equalTo: player8.bottomAnchor, constant: 0).isActive = true
            name8.centerXAnchor.constraint(equalTo: player8.centerXAnchor, constant: 0).isActive = true
            name8.widthAnchor.constraint(equalTo: player8.widthAnchor, multiplier:1.2).isActive = true
            
            player9.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player9.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name9.topAnchor.constraint(equalTo: player9.bottomAnchor, constant: 0).isActive = true
            name9.centerXAnchor.constraint(equalTo: player9.centerXAnchor, constant: 0).isActive = true
            name9.widthAnchor.constraint(equalTo: player9.widthAnchor, multiplier:1.2).isActive = true
            
        case 10:
            topPlayersStackView.topAnchor.constraint(equalTo: topViewContainerView.topAnchor, constant: 0).isActive = true
            topPlayersStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: 0).isActive = true
            topPlayersStackView.leadingAnchor.constraint(equalTo: topViewContainerView.leadingAnchor, constant: 0).isActive = true
            topPlayersStackView.trailingAnchor.constraint(equalTo: topViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player1.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player1.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name1.bottomAnchor.constraint(equalTo: player1.topAnchor, constant: -10).isActive = true
            name1.centerXAnchor.constraint(equalTo: player1.centerXAnchor, constant: 0).isActive = true
            name1.widthAnchor.constraint(equalTo: player1.widthAnchor, multiplier:1.2).isActive = true
             
             
            player2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name2.bottomAnchor.constraint(equalTo: player2.topAnchor, constant: -10).isActive = true
            name2.centerXAnchor.constraint(equalTo: player2.centerXAnchor, constant: 0).isActive = true
            name2.widthAnchor.constraint(equalTo: player2.widthAnchor, multiplier:1.2).isActive = true
              
             
            player3.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player3.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name3.bottomAnchor.constraint(equalTo: player3.topAnchor, constant: -10).isActive = true
            name3.centerXAnchor.constraint(equalTo: player3.centerXAnchor, constant: 0).isActive = true
            name3.widthAnchor.constraint(equalTo: player3.widthAnchor, multiplier:1.2).isActive = true
            
            player4.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player4.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name4.bottomAnchor.constraint(equalTo: player4.topAnchor, constant: -10).isActive = true
            name4.centerXAnchor.constraint(equalTo: player4.centerXAnchor, constant: 0).isActive = true
            name4.widthAnchor.constraint(equalTo: player4.widthAnchor, multiplier:1.2).isActive = true
            
            player5.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player5.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name5.bottomAnchor.constraint(equalTo: player5.topAnchor, constant: -10).isActive = true
            name5.centerXAnchor.constraint(equalTo: player5.centerXAnchor, constant: 0).isActive = true
            name5.widthAnchor.constraint(equalTo: player5.widthAnchor, multiplier:1.2).isActive = true
             
            bottomPlayersStackView.topAnchor.constraint(equalTo: bottomViewContainerView.topAnchor, constant: 0).isActive = true
            bottomPlayersStackView.bottomAnchor.constraint(equalTo: bottomViewContainerView.bottomAnchor, constant: 0).isActive = true
            bottomPlayersStackView.leadingAnchor.constraint(equalTo: bottomViewContainerView.leadingAnchor, constant: 0).isActive = true
            bottomPlayersStackView.trailingAnchor.constraint(equalTo: bottomViewContainerView.trailingAnchor, constant: 0).isActive = true
             
            player6.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player6.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name6.topAnchor.constraint(equalTo: player6.bottomAnchor, constant: 0).isActive = true
            name6.centerXAnchor.constraint(equalTo: player6.centerXAnchor, constant: 0).isActive = true
            name6.widthAnchor.constraint(equalTo: player6.widthAnchor, multiplier:1.2).isActive = true
             
             
            player7.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player7.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name7.topAnchor.constraint(equalTo: player7.bottomAnchor, constant: 0).isActive = true
            name7.centerXAnchor.constraint(equalTo: player7.centerXAnchor, constant: 0).isActive = true
            name7.widthAnchor.constraint(equalTo: player7.widthAnchor, multiplier:1.2).isActive = true
             
            player8.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player8.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name8.topAnchor.constraint(equalTo: player8.bottomAnchor, constant: 0).isActive = true
            name8.centerXAnchor.constraint(equalTo: player8.centerXAnchor, constant: 0).isActive = true
            name8.widthAnchor.constraint(equalTo: player8.widthAnchor, multiplier:1.2).isActive = true
            
            player9.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player9.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name9.topAnchor.constraint(equalTo: player9.bottomAnchor, constant: 0).isActive = true
            name9.centerXAnchor.constraint(equalTo: player9.centerXAnchor, constant: 0).isActive = true
            name9.widthAnchor.constraint(equalTo: player9.widthAnchor, multiplier:1.2).isActive = true
            
            player10.widthAnchor.constraint(equalToConstant: 100).isActive = true
            player10.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            name10.topAnchor.constraint(equalTo: player10.bottomAnchor, constant: 0).isActive = true
            name10.centerXAnchor.constraint(equalTo: player10.centerXAnchor, constant: 0).isActive = true
            name10.widthAnchor.constraint(equalTo: player10.widthAnchor, multiplier:1.2).isActive = true
            
        default:
            print("Error")
        }
         
        
        
        
        
        
         //when there are 6 participants
        
         //when there are 7 participants
        
         //when there are 8 participants
        
         //when there are 9 participants
        
         //when there are 10 participants
                
    }
    
    
    
    


}
