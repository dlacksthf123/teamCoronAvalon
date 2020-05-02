//
//  QuestResults.swift
//  coronaValon
//
//  Created by Isabel Daniels on 5/2/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit
class QuestResultsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func addingViews() {
        view.addSubview(backgroundImage)
        view.addSubview(instructions)
        //        view.addSubview(successLabel)
        //        view.addSubview(failLabel)
        //        view.addSubview(failButton)
        //        view.addSubview(successButton)
        
        
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
    }
}
