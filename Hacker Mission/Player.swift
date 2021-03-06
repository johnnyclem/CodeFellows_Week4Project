//
//  PlayerForGame.swift
//  Hacker Mission
//
//  Created by Nathan Birkholz on 10/27/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

enum PlayerType: NSInteger {
    case Hacker = 1, Agent
}

class Player : NSObject, NSCoding {

    var playerDictionary : NSMutableDictionary

    var playerName : NSString 
    var playerID : NSInteger
    var peerID : NSString
//    var playerImage : UIImage
    var playerRole : PlayerType = .Hacker
    var isNominated =  false
    var isLeader = false
    var currentVote : Bool?


    init(playerDictionary: NSMutableDictionary) {
        var playerDictionary = playerDictionary as NSMutableDictionary
        self.playerName = playerDictionary["playerName"] as NSString
        self.playerID = playerDictionary["playerID"] as NSInteger
        self.playerDictionary = playerDictionary
//        self.playerImage = playerDictionary["playerImage"] as UIImage
        self.peerID = playerDictionary["peerID"] as NSString
      
    }

    required init(coder aDecoder: NSCoder) {

        self.playerName = aDecoder.decodeObjectForKey("playerName") as NSString
        self.playerID = aDecoder.decodeIntegerForKey("playerID") as NSInteger
//        let data = aDecoder.decodeObjectForKey("playerImage") as NSData
//        self.playerImage = UIImage(data: data)!
        self.peerID = aDecoder.decodeObjectForKey("peerID") as NSString
        let playerRoleFor = aDecoder.decodeObjectForKey("playerRole") as NSInteger
        var playerRoleIs = PlayerType(rawValue: playerRoleFor)
        self.playerRole = playerRoleIs as PlayerType!
        self.isNominated = aDecoder.decodeBoolForKey("isNominated") as Bool
        self.isLeader = aDecoder.decodeBoolForKey("isLeader") as Bool
        self.currentVote = aDecoder.decodeBoolForKey("currentVote") as Bool?
        self.playerDictionary = aDecoder.decodeObjectForKey("playerDictionary") as NSMutableDictionary

    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.playerName, forKey: "playerName")
        aCoder.encodeInteger(self.playerID, forKey: "playerID")
//        let data = UIImagePNGRepresentation(self.playerImage)
//        aCoder.encodeObject(data, forKey: "playerImage")
        aCoder.encodeObject(self.peerID, forKey: "peerID")
        aCoder.encodeObject(self.playerRole.rawValue, forKey: "playerRole")
        aCoder.encodeBool(self.isNominated, forKey: "isNominated")
        aCoder.encodeBool(self.isLeader, forKey: "isLeader")
        if self.currentVote != nil {
            aCoder.encodeBool(self.currentVote!, forKey: "currentVote")
        }
        aCoder.encodeObject(self.playerDictionary, forKey: "playerDictionary")


    }


    class func makePlayerDictionaryForGameSession (userInfo: UserInfo) -> NSMutableDictionary {
        var playerDictionary = NSMutableDictionary()
        playerDictionary.setObject(userInfo.userName, forKey: "playerName")
        playerDictionary.setObject(userInfo.userID, forKey: "playerID")
        playerDictionary.setObject(userInfo.userPeerID!, forKey: "peerID")
//        playerDictionary.setObject(userInfo.userImage, forKey: "playerImage")
        return playerDictionary as NSMutableDictionary
    }



} // End
