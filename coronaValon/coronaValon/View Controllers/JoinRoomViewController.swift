//
//  JoinRoomViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/12/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit

class JoinRoomViewController: UIViewController {
        
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
    
    let upperContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lowerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let roomCodeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.placeholder = "Type a room code here"
        textField.textAlignment = .center
        let bar = UIToolbar()
        let doneButton = UIBarButtonItem(title:"Done", style: .plain, target: self, action: #selector(doneTapped))
        doneButton.tintColor = .systemBlue
        bar.barTintColor = .lightGray
        bar.items = [doneButton]
        bar.sizeToFit()
        textField.inputAccessoryView = bar
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.placeholder = "Enter your name"
        
        textField.textAlignment = .center
        let bar = UIToolbar()
        let doneButton = UIBarButtonItem(title:"Done", style: .plain, target: self, action: #selector(doneTapped))
        doneButton.tintColor = .systemBlue
        bar.barTintColor = .lightGray
        bar.items = [doneButton]
        bar.sizeToFit()
        textField.inputAccessoryView = bar
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let joinButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Join", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel!.textColor = .black
        button.addTarget(self, action: #selector(joinTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .green
        title = "Create a Room"
        addingViews()
        addingConstraints()
        
        //keyboard
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func joinTapped() {
        //Validate all the required fields
        let roomCode = roomCodeTextField.text!
        let name = nameTextField.text!
        //check if all the fields are either typed or selected
        if roomCodeTextField.text! == "" || name == "" {
            //error message
            presentAlertViewController(title: "Error", message: "Make sure to fill out all the required fields")
            return
        }
        
        checkRoomCode {
            db.collection("roomCodes").document(roomCode).addSnapshotListener { (documentSnapshot, error) in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                let numPart = Int(data["participantNum"] as! String)
                let leader = data["leader"] as! Int
                let numSucesses = data["numSucesses"] as! Int
                let numFails = data["numFails"] as! Int
                var players = data["players"] as! [String]
                let env = gameEnv(roomCode: roomCode, numPart: numPart!, leader: leader, numSucesses: numSucesses, numFails: numFails, player: players.count)
                theGame.updateEnv(env: env)
                let lobbyViewController = LobbyViewController()
                self.navigationController?.pushViewController(lobbyViewController, animated: true)
                
                players.append(name)
                
                db.collection("roomCodes").document(roomCode).setData(["participantNum": data["participantNum"] as! String, "leader": 0, "numSucesses": 0, "numFails": 0, "players": players]) { (error) in
                    
                    if error != nil {
                        //show error message
                        self.presentAlertViewController(title: "Error", message: "Error adding player. Please try again.")
                    }
                }
            }
        }
        
//        db.collection("roomCodes").getDocuments { (docs, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in docs!.documents {
//                    if document.documentID == roomCode {
//                        let data = document.data()
//                        let numPart = Int(data["participantNum"] as! String)
//                        let leader = data["leader"] as! Int
//                        let numSucesses = data["numSucesses"] as! Int
//                        let numFails = data["numFails"] as! Int
//                        var players = data["players"] as! [String]
//                        let env = gameEnv(roomCode: roomCode, numPart: numPart!, leader: leader, numSucesses: numSucesses, numFails: numFails, player: players.count)
//                        theGame.updateEnv(env: env)
//                        let lobbyViewController = LobbyViewController()
//                        self.navigationController?.pushViewController(lobbyViewController, animated: true)
//
//                        players.append(name)
//
//                        db.collection("roomCodes").document(roomCode).setData(["participantNum": data["participantNum"] as! String, "leader": 0, "numSucesses": 0, "numFails": 0, "players": players]) { (error) in
//
//                            if error != nil {
//                                //show error message
//                                self.presentAlertViewController(title: "Error", message: "Error adding player. Please try again.")
//                            }
//                        }
//
//                        return
//                    }
//                }
//                self.presentAlertViewController(title: "Error", message: "The room code does not exist")
//                return
//            }
//        }
    }
    
    @objc func doneTapped() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height
        } else {
            view.frame.origin.y = 0
        }
    }
    
    func checkRoomCode(completion: @escaping () -> Void) {
        let roomCode = roomCodeTextField.text!
        var isRoomCode = false
        db.collection("roomCodes").getDocuments { (docs, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in docs!.documents {
                if document.documentID == roomCode {
                    isRoomCode = true
                }
            }
            if isRoomCode {
                completion()
                return
            } else {
                self.presentAlertViewController(title: "Error", message: "The room code already exists please try a different one")
                return
            }
        }
        }
    }
    
    func presentAlertViewController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    

    func addingViews() {
        view.addSubview(upperContainerView)
        upperContainerView.addSubview(logoLabel)
        upperContainerView.addSubview(roomCodeTextField)
        upperContainerView.addSubview(nameTextField)
        view.addSubview(lowerContainerView)
        lowerContainerView.addSubview(joinButton)

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
        
        roomCodeTextField.centerXAnchor.constraint(equalTo: upperContainerView.centerXAnchor, constant: 0).isActive = true
        roomCodeTextField.bottomAnchor.constraint(equalTo: upperContainerView.centerYAnchor, constant: view.safeAreaLayoutGuide.layoutFrame.height * (2/27)-15).isActive = true
        roomCodeTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        roomCodeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        nameTextField.centerXAnchor.constraint(equalTo: upperContainerView.centerXAnchor, constant: 0).isActive = true
        nameTextField.topAnchor.constraint(equalTo: roomCodeTextField.bottomAnchor, constant: 20).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //lowerContainerView constraints
        lowerContainerView.topAnchor.constraint(equalTo: upperContainerView.bottomAnchor, constant: 0).isActive = true
        lowerContainerView.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
        lowerContainerView.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
        lowerContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        joinButton.centerXAnchor.constraint(equalTo: lowerContainerView.centerXAnchor, constant: 0).isActive = true
        joinButton.centerYAnchor.constraint(equalTo: lowerContainerView.centerYAnchor, constant: 0).isActive = true
        joinButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        joinButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
               
    }

}

