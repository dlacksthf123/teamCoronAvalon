//
//  CreateRoomViewController.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/12/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import UIKit
import Firebase

class CreateRoomViewController: UIViewController {
    
    var completionHandlers: [() -> Void] = []
    var listener: ListenerRegistration?
    
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
        textField.placeholder = "Type and create a room code here"
       
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
    
    let participantNumTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        
        let bar = UIToolbar()
        let doneButton = UIBarButtonItem(title:"Done", style: .plain, target: self, action: #selector(doneTapped))
        doneButton.tintColor = .systemBlue
        bar.tintColor = .lightGray
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
    
    let participantNumPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .systemGray
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let createButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("create", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel!.textColor = .black
        button.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pickerData = ["5", "6", "7", "8", "9", "10"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .green
        title = "Create a Room"
        addingViews()
        addingConstraints()
        
        participantNumTextField.inputView = participantNumPickerView
        participantNumTextField.textAlignment = .center
        participantNumTextField.placeholder = "Choose a number"
        participantNumPickerView.delegate = self
        participantNumPickerView.dataSource = self
        
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
    
    @objc func createTapped() {
        //Validate all the required fields
        let roomCode = roomCodeTextField.text!
        let participantNum = participantNumTextField.text!
        let name = nameTextField.text!
        
        //check if all the fields are either typed or selected
        if roomCode == "" || participantNum == "" || name == "" {
            //error message
            presentAlertViewController(title: "Error", message: "Make sure to fill out all the required fields")
            return
        }
        checkRoomCode {
            self.updateFirebase {
                self.listener = db.collection("roomCodes").document(roomCode).addSnapshotListener(includeMetadataChanges: false) { documentSnapshot, error in
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
                }

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
    func updateFirebase(completion: @escaping () -> Void) {
        //Validate all the required fields
        let roomCode = roomCodeTextField.text!
        let participantNum = participantNumTextField.text!
        let name = nameTextField.text!
        
        db.collection("roomCodes").document(roomCode).setData(["participantNum": participantNum, "leader": 0, "numSucesses": 0, "numFails": 0, "players": [name]]) { (error) in
            
            if error != nil {
                //show error message
                self.presentAlertViewController(title: "Error", message: "Error creating a room")
            } else {
                //update info to the game model
                //change string num into an int
                guard let partNum = Int(participantNum) else { return }
                let env = gameEnv(roomCode: roomCode, numPart: partNum, leader: 0, numSucesses: 0, numFails: 0, player: 0)
                theGame.updateEnv(env: env)
                //move to the lobby view
                let lobbyViewController = LobbyViewController()
                self.navigationController?.pushViewController(lobbyViewController, animated: true)
            }
            completion()
        }
    }
    
    func checkRoomCode(completion: @escaping () -> Void) {
        let roomCode = roomCodeTextField.text!
        db.collection("roomCodes").getDocuments { (docs, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in docs!.documents {
                if document.documentID == roomCode {
                    self.presentAlertViewController(title: "Error", message: "The room code already exists please try a different one")
                    return
                }
            }
        }
        completion()
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
//        view.addSubview(middleContainerView)
        upperContainerView.addSubview(roomCodeTextField)
        upperContainerView.addSubview(participantNumTextField)
        upperContainerView.addSubview(nameTextField)
        view.addSubview(lowerContainerView)
        lowerContainerView.addSubview(createButton)
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

        participantNumTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        participantNumTextField.topAnchor.constraint(equalTo: roomCodeTextField.bottomAnchor, constant: 20).isActive = true
        participantNumTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        participantNumTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.centerXAnchor.constraint(equalTo: participantNumTextField.centerXAnchor, constant: 0).isActive = true
        nameTextField.topAnchor.constraint(equalTo: participantNumTextField.topAnchor, constant: 70).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //lowerContainerView constraints
        lowerContainerView.topAnchor.constraint(equalTo: upperContainerView.bottomAnchor, constant: 0).isActive = true
        lowerContainerView.leadingAnchor.constraint(equalTo: upperContainerView.leadingAnchor, constant: 0).isActive = true
        lowerContainerView.trailingAnchor.constraint(equalTo: upperContainerView.trailingAnchor, constant: 0).isActive = true
        lowerContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        createButton.centerXAnchor.constraint(equalTo: lowerContainerView.centerXAnchor, constant: 0).isActive = true
        createButton.centerYAnchor.constraint(equalTo: lowerContainerView.centerYAnchor, constant: 0).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
               
    }

}

extension CreateRoomViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        participantNumTextField.text = pickerData[row]
        return pickerData[row]
    }
    
}
