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
        self.gEnv = gameEnv(roomCode: "", numPart: 0, leader: 0, numSucesses: 0, numFails: 0, player: 0, roles: [], stage: 0, votes: [], eligible: [], nominated: [])
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
            
            db.collection("roomCodes").document(self.gEnv.roomCode).setData(["roles": rolelist, "stage": 1], merge: true) { (error) in
                if error != nil {
                    print("failed to initalize the game")
                    success = false
                    return
                }
            }
            gEnv.roles = rolelist
            gEnv.stage = 1
            return success
        }
        return false
    }
    
    func vote(value: Int) {
//        var success = true
        gEnv.votes[gEnv.player] = value
        var numVoted = 0
        for i in gEnv.eligible {
            if gEnv.votes[i] != -1 {
                numVoted += 1
            }
        }
        //if everyone eligible has voted
        if numVoted == gEnv.eligible.count {
            if gEnv.stage == 3 {
                nomination()
                return
            } else if gEnv.stage == 5 {
                quest()
                return
            } else if gEnv.stage == 7 {
                guessAnalyst()
                return
            }
        } else {
            db.collection("roomCodes").document(gEnv.roomCode).setData(["votes": gEnv.votes], merge: true) { (error) in
                if error != nil {
//                    success = false
                    print("warning: failed to write vote data")
                    return
                }
            }
        }
    }
    
//    func playTurn() {
//        /* Go through the stages of a turn if you're the leader */
//        if (nomination()) {
//            if (quest()) {
//                gEnv.numSucesses += 1
//            } else {
//                gEnv.numFails += 1
//            }
//            if (gEnv.numSucesses == 3) {
//                if (guessAnalyst()) {
//                    //Viruses win
//                } else {
//                    //medical staff win
//                }
//            } else if (gEnv.numFails == 3) {
//                //viruses win
//            }
//        } else {
//            //move leader to the next person, this "turn" is over.
//        }
//        return
//    }
    
    func nomination() {
        /* The leader gets to choose some players as the nominees.
         Then, the players will vote on this nomination.
         Return true if the nomination process was a success, and false if it fails.
         Update the firebase collection with the correct leader information if */
        var votesFor = 0
        for i in gEnv.votes {
            votesFor += i
        }
        if votesFor < gEnv.numPart / 2 + 1 {
            var votes : [Int] = []
            for _ in 0..<gEnv.numPart {
                votes.append(-1)
            }
            db.collection("roomCodes").document(gEnv.roomCode).setData(["leader": (gEnv.leader + 1) % gEnv.numPart, "votes": votes, "stage": 2, "nominated": []], merge: true) { (error) in
                if error != nil {
                    print("error in advancing leader")
                }
            }
        } else {
            var votes : [Int] = []
            var eligible : [Int] = []
            for i in gEnv.nominated {
                votes.append(-1)
                eligible.append(i)
            }
            db.collection("roomCodes").document(gEnv.roomCode).setData(["votes": votes, "eligible": eligible, "stage": 4, "nominated": []], merge: true) { (error) in
                if error != nil {
                    print("error in advancing to stage 4")
                }
            }
        }
    }
    
    func quest() {
        /* The chosen team votes on whether a quest succeeds or fails.
        Return true if the quest was a success, and false if it fails.
        If there are 7 or more players in the game, and it's the 4th quest
         then two fail votes are required to fail the quest. Otherwise, only one is needed. */
        var votesAgainst = 0
        for i in gEnv.votes {
            if i == 0 {
                votesAgainst += 1
            }
        }
        if gEnv.numFails + gEnv.numSucesses + 1 == 4 && gEnv.numPart >= 7 {
            if votesAgainst >= 2 {
                gEnv.numFails += 1
            } else {
                gEnv.numSucesses += 1
            }
        } else if votesAgainst >= 1 {
            gEnv.numFails += 1
        } else {
            gEnv.numSucesses += 1
        }
        var votes : [Int] = []
        var eligible: [Int] = []
        if gEnv.numFails == 3 {
            votes = []
            eligible = []
        } else if gEnv.numSucesses == 3 {
            //going to the guess analyst stage later
            var votes : [Int] = []
            var eligible : [Int] = []
            for i in 0..<gEnv.roles.count {
                if gEnv.roles[i] == "virus" {
                    votes.append(-1)
                    eligible.append(i)
                }
            }
        } else {
            //back to nomination stage afterwards
            var votes : [Int] = []
            var eligible : [Int] = []
            for i in 0..<gEnv.roles.count {
                votes.append(-1)
                eligible.append(i)
            }
        }
        
        db.collection("roomCodes").document(gEnv.roomCode).setData(["votes": votes, "eligible": eligible, "stage": 6, "numSucesses": gEnv.numSucesses, "numFails": gEnv.numFails], merge: true) { (error) in
            if error != nil {
                print("error in advancing to stage 6 (viruses win)")
            }
            if self.gEnv.numSucesses == 3 {
                print("Will move to guessing analyst stage")
            } else if self.gEnv.numFails == 3 {
                print("Viruses win")
            } else {
                print("Back to nomination later")
            }
        }
    }
    
    func guessAnalyst() {
        /* If the healthcare staff reach 3 succeeding quests, then the viruses
         have one last chance to win the game. If they can guess (vote) on the correct analyst,
         then they win. */
        //getting analyst index
        var analyst = -1
        var temp = 0
        for i in gEnv.roles {
            if i == roles.analyst {
                analyst = temp
                break
            }
            temp += 1
        }
        var virusWin = true
        for vote in gEnv.votes {
            if vote != analyst {
                virusWin = false
                break
            }
        }
        
        db.collection("roomCodes").document(gEnv.roomCode).setData(["stage": 6, "numSucesses": gEnv.numSucesses, "numFails": 4], merge: true) { (error) in
            if error != nil {
                print("error in advancing to stage 6 (viruses win)")
            }
        }
        
    }
    
    func endGame() {
        db.collection("roomCodes").document(gEnv.roomCode).delete()
        self.gEnv = gameEnv(roomCode: "", numPart: 0, leader: 0, numSucesses: 0, numFails: 0, player: 0, roles: [], stage: 0, votes: [], eligible: [], nominated: [])
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
    var nominated: [Int]
}

enum roles {
    static let doctor = "doctor"
    static let nurse = "nurse"
    static let analyst = "analyst"
    static let virus = "virus"
}
