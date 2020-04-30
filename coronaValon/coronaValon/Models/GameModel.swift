//
//  GameModel.swift
//  coronaValon
//
//  Created by Chansol Lim on 4/18/20.
//  Copyright © 2020 CoronAvalon. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var db = Firestore.firestore()

class gameModel {
    var roomCode: String
    var numPart: Int
    var isLeader: Bool
    
    //joining a game
    init(roomCode: String) {
        self.roomCode = roomCode
        //TODO()
        self.numPart = 0
        self.isLeader = false
        
    }
    
    //creating a game
    init(roomCode: String, numPart: Int, isLeader: Bool) {
        self.roomCode = roomCode
        self.numPart = numPart
        self.isLeader = isLeader
    }
}

struct coronAvalon: Decodable {
    var roomCode: String
    var numPart: Int
    var isLeader: Bool
}
