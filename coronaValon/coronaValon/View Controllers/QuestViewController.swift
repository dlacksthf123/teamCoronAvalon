//
//  QuestViewController.swift
//  coronaValon
//
//  Created by Isabel Daniels on 5/2/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
        addingConstraints()
        view.backgroundColor = .black
        
    }
    
    let backgroundImage: UIImageView = {
        var tiles = UIImage(named: "grocerystoreart")
        var background = UIImageView(image: tiles)
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let instructions: UILabel = {
        let label = UILabel()
        label.text = "You arrive at the grocery store."
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let successButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named:"success2.png"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(approvedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func approvedButtonTapped() {
        let resultsViewController = ResultsViewController()

        navigationController?.pushViewController(resultsViewController, animated: true)
    }
    
    let successLabel: UILabel = {
        let label = UILabel()
        var text = "Do you put on your mask?"
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let failButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named:"denied.png"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(deniedButtonTapped), for: .touchUpInside)
        return button
    }()
    
        @objc func deniedButtonTapped() {
            let resultsViewController = ResultsViewController()
            
            navigationController?.pushViewController(resultsViewController, animated: true)
        }
    
    let failLabel: UILabel = {
        let label = UILabel()
        var text = "or just walk in?"
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func addingViews() {
        view.addSubview(backgroundImage)
        view.addSubview(instructions)
        view.addSubview(successLabel)
        view.addSubview(failLabel)
        view.addSubview(failButton)
        view.addSubview(successButton)
        
        
    }
    
    func addingConstraints() {
        //background constraints
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        
        //instruction label
        instructions.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        instructions.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        instructions.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        //success label
        successLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        successLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        successLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
//        //fail label
        failLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        failLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        failLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
  
        
        //approve button
        successButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 135).isActive = true
        successButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        successButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        successButton.heightAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
        
        //deny button
          failButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -135).isActive = true
          failButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
          failButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
          failButton.heightAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
    }
}
