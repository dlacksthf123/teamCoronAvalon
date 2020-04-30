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
        
        //check if all the fields are either typed or selected
        if roomCode == "" || participantNum == "" {
            //error message
            presentAlertViewController(title: "Error", message: "Make sure to fill out all the required fields")
            return
        }
        
        //check if the room code exists
        

        db.collection("roomCodes").document(roomCode).setData(["participantNum": participantNum, "isLeader": true]) { (error) in
            
            if error != nil {
                //show error message
                self.presentAlertViewController(title: "Error", message: "Error creating a room")
            } else {
                //update info to the game model
                
                //move to the lobby view
                let lobbyViewController = LobbyViewController()
                self.navigationController?.pushViewController(lobbyViewController, animated: true)
            }
        }
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
