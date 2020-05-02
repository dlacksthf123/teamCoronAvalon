//
//  JoinRoomViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/12/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit
import Firebase

class JoinRoomViewController: UIViewController {
        
    var listener : ListenerRegistration?
    
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
    
    let roomCodeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)
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
        textField.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)
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
         button.backgroundColor = UIColor(red: 0.34, green: 0.65, blue: 1.00, alpha: 1.00)
         button.setTitle("Join", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.titleLabel!.textColor = .white
         button.addTarget(self, action: #selector(joinTapped), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.layer.cornerRadius = 15
         button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
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
        
        db.collection("roomCodes").getDocuments { (docs, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in docs!.documents {
                    if document.documentID == roomCode {
                        let data = document.data()
                        let numPart = Int(data["participantNum"] as! String)
                        let leader = data["leader"] as! Int
                        let numSucesses = data["numSucesses"] as! Int
                        let numFails = data["numFails"] as! Int
                        var players = data["players"] as! [String]
                        let roles = data["roles"] as! [String]
                        let stage = data["stage"] as! Int
                        let eligible = data["eligible"] as! [Int]
                        let votes = data["votes"] as! [Int]
                        let env = gameEnv(roomCode: roomCode, numPart: numPart!, leader: leader, numSucesses: numSucesses, numFails: numFails, player: players.count, roles: roles, stage: stage, votes: votes, eligible: eligible)
                        theGame.updateEnv(env: env)
                        let lobbyViewController = LobbyViewController()
                        self.navigationController?.pushViewController(lobbyViewController, animated: true)
                        
                        //if the room is full, don't join it
                        
                        if (players.count == numPart) {
                            self.presentAlertViewController(title: "Error", message: "Room is full.")
                            return
                        }
                        
                        players.append(name)
                        
                        db.collection("roomCodes").document(roomCode).setData(["players": players], merge: true) { (error) in
                            
                            if error != nil {
                                //show error message
                                self.presentAlertViewController(title: "Error", message: "Error adding player. Please try again.")
                            } else {
                                self.makeListener(roomCode: roomCode)
                            }
                        }
                        
                        return
                    }
                }
                self.presentAlertViewController(title: "Error", message: "The room code does not exist")
                return
            }
        }
    }
    
    @objc func doneTapped() {
        if let listen = listener {
            listen.remove()
        }
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
    
    func makeListener(roomCode: String) {
        self.listener = db.collection("roomCodes").document(roomCode).addSnapshotListener(includeMetadataChanges: false) { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            print("Data from listener: \(data)")
            let numPart = Int(data["participantNum"] as! String)
            let leader = data["leader"] as! Int
            let numSucesses = data["numSucesses"] as! Int
            let numFails = data["numFails"] as! Int
            let roles = data["roles"] as! [String]
            let stage = data["stage"] as! Int
            let eligible = data["eligible"] as! [Int]
            let votes = data["votes"] as! [Int]
            let env = gameEnv(roomCode: roomCode, numPart: numPart!, leader: leader, numSucesses: numSucesses, numFails: numFails, player: theGame.gEnv.player, roles: roles, stage: stage, votes: votes, eligible: eligible)
            theGame.updateEnv(env: env)
        }

    }
    
    
    func presentAlertViewController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    

   func addingViews() {
        view.addSubview(backgroundImage)
        view.addSubview(upperContainerView)
        upperContainerView.addSubview(logoImage)
        
        upperContainerView.addSubview(roomCodeTextField)
        upperContainerView.addSubview(nameTextField)
        view.addSubview(lowerContainerView)
        lowerContainerView.addSubview(virusImage)
        lowerContainerView.addSubview(joinButton)

    }
    
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
        
        virusImage.topAnchor.constraint(equalTo: lowerContainerView.centerYAnchor, constant: -100).isActive = true
        virusImage.leftAnchor.constraint(equalTo: lowerContainerView.centerXAnchor, constant: -50).isActive = true
        virusImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        virusImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
               
    }

}

