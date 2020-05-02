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
var theGame = gameModel()

class gameModel {
//    var roomCode: String
//    var numPart: Int
//    var isLeader: Bool
//    var numSucesses = 0
//    var numFails = 0
    var gEnv: gameEnv
    
    init() {
        self.gEnv = gameEnv(roomCode: "", numPart: 0, leader: 0, numSucesses: 0, numFails: 0, player: 0, roles: [], stage: 0, votes: [], eligible: [])
    }
    
//    //joining a game
//    init(roomCode: String) {
//        self.roomCode = roomCode
//        //TODO()
//        self.numPart = 0
//        self.isLeader = false
//
//    }
//
//    //creating a game
//    init(roomCode: String, numPart: Int, isLeader: Bool) {
//        self.roomCode = roomCode
//        self.numPart = numPart
//        self.isLeader = isLeader
//    }
    func updateEnv(env: gameEnv) {
        self.gEnv = env
    }
    
    func startGame()->Bool {
        /* Assigns the roles of each player in the game.
         Returns true if the role assignment is successful. */
        if (gEnv.leader == gEnv.player) {
            //for each player in the relevant document, assign a role...
            var rolelist : [String] = []
            switch (self.gEnv.numPart) {
            case 5:
                rolelist = [roles.virus, roles.virus, roles.analyst, roles.doctor, roles.nurse]
            case 6:
                rolelist = [roles.virus, roles.virus, roles.analyst, roles.doctor, roles.nurse, roles.nurse]
            case 7:
                rolelist = [roles.virus, roles.virus, roles.analyst, roles.doctor, roles.nurse, roles.nurse, roles.virus]
            case 8:
                rolelist = [roles.virus, roles.virus, roles.analyst, roles.doctor, roles.nurse, roles.nurse, roles.virus, roles.doctor]
            case 9:
                rolelist = [roles.virus, roles.virus, roles.analyst, roles.doctor, roles.nurse, roles.nurse, roles.virus, roles.doctor, roles.nurse]
            case 10:
                rolelist = [roles.virus, roles.virus, roles.analyst, roles.doctor, roles.nurse, roles.nurse, roles.virus, roles.doctor, roles.nurse, roles.virus]
            default:
                return false
            }
            rolelist.shuffle()
            var success = true
            
            db.collection("roomCodes").document(self.gEnv.roomCode).setData(["roles": rolelist], merge: true) { (error) in
                if error != nil {
                    print("failed to initalize the game")
                    success = false
                    return
                }
            }
            gEnv.roles = rolelist
            return success
        }
        return false
    }
    
    func playTurn() {
        /* Go through the stages of a turn if you're the leader */
        if (nomination()) {
            if (quest()) {
                gEnv.numSucesses += 1
            } else {
                gEnv.numFails += 1
            }
            if (gEnv.numSucesses == 3) {
                if (guessAnalyst()) {
                    //Viruses win
                } else {
                    //medical staff win
                }
            } else if (gEnv.numFails == 3) {
                //viruses win
            }
        } else {
            //move leader to the next person, this "turn" is over.
        }
        return
    }
    
    func nomination()->Bool {
        /* The leader gets to choose some players as the nominees.
         Then, the players will vote on this nomination.
         Return true if the nomination process was a success, and false if it fails.
         Update the firebase collection with the correct leader information if */
        return false
    }
    
    func quest()->Bool {
        /* The chosen team votes on whether a quest succeeds or fails.
        Return true if the quest was a success, and false if it fails.
        If there are 7 or more players in the game, and it's the 4th quest
         then two fail votes are required to fail the quest. Otherwise, only one is needed. */
        return false
    }
    
    func guessAnalyst()->Bool {
        /* If the healthcare staff reach 3 succeeding quests, then the viruses
         have one last chance to win the game. If they can guess (vote) on the correct analyst,
         then they win. */
        return false;
    }
    
    func endGame() {
        //clean up firebase after a game ends
    }
}

struct gameEnv: Decodable {
    var roomCode: String
    var numPart: Int
    var leader: Int
    var numSucesses: Int
    var numFails: Int
    var player: Int
    var roles: [String]
    var stage: Int
    var votes: [Int]
    var eligible: [Int]
}

enum roles {
    static let doctor = "doctor"
    static let nurse = "nurse"
    static let analyst = "analyst"
    static let virus = "virus"
}
