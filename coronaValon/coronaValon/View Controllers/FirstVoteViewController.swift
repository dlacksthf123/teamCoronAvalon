//
//  firstvote.swift
//  coronaValon
//
//  Created by Isabel Daniels on 5/2/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class FirstVoteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nomination Vote"
        addingViews()
        addingConstraints()
        view.backgroundColor = .black
        
    }
    
    let backgroundImage: UIImageView = {
        var tiles = UIImage(named: "gray_tiles")
        var background = UIImageView(image: tiles)
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let approveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named:"approve.png"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(approvedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func approvedButtonTapped() {
        let resultsViewController = QuestResultsViewController()

        navigationController?.pushViewController(resultsViewController, animated: true)
    }
    
    let denyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named:"thumbsdown.png"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(deniedButtonTapped), for: .touchUpInside)
        return button
    }()
    
        @objc func deniedButtonTapped() {
            let resultsViewController = QuestResultsViewController()
            
            navigationController?.pushViewController(resultsViewController, animated: true)
        }
    
    let instructions: UILabel = {
        let label = UILabel()
        label.text = "Approve or deny the quest!"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func addingViews() {
        view.addSubview(backgroundImage)
        view.addSubview(approveButton)
        view.addSubview(denyButton)
        view.addSubview(instructions)
        
        
    }
    
    func addingConstraints() {
        //background constraints
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        
        //approve button
        approveButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -200).isActive = true
        approveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        approveButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        approveButton.heightAnchor.constraint(equalTo: approveButton.widthAnchor).isActive = true
        
        //deny button
        denyButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 150).isActive = true
        denyButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        denyButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        denyButton.heightAnchor.constraint(equalTo: approveButton.widthAnchor).isActive = true
        
        //label
        instructions.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        instructions.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        instructions.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        instructions.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    }
    
}
