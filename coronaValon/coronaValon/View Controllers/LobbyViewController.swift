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
        view.backgroundColor = .yellow
        title = "Lobby"
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

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
