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
    var numSucesses = 0
    var numFails = 0
    
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
    
    func startGame()->Bool {
        /* Returns true */
        if (isLeader) {
            //for each player in the relevant document, assign a role...
//            switch (self.numPart) {
//            case 5:
//            case 6:
//            case 7:
//            case 8:
//            case 9:
//            case 10:
//            default:
//
//            }
        }
        return false
    }
    
    func playTurn() {
        if (nomination()) {
            if (quest()) {
                numSucesses += 1
            } else {
                numFails += 1
            }
            if (numSucesses == 3) {
                if (guessAnalyst()) {
                    //Viruses win
                } else {
                    //medical staff win
                }
            } else if (numFails == 3) {
                //viruses win
            }
        } else {
            //move leader to the next person, this "turn" is over.
        }
        return
    }
    
    func nomination()->Bool {
        return false
    }
    
    func quest()->Bool {
        return false
    }
    
    func guessAnalyst()->Bool {
        return false;
    }
    
    func endGame() {
        //clean up firebase
    }
}

struct coronAvalon: Decodable {
    var roomCode: String
    var numPart: Int
    var isLeader: Bool
}

enum roles {
    static let doctor = "doctor"
    static let nurse = "nurse"
    static let analyst = "analyst"
    static let virus = "virus"
}
