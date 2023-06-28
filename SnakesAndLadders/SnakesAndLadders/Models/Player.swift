//
//  Player.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import Foundation

class Player {
    var name : String = ""
    var position : Int = 0
    var status : Bool
    var token: Int = 0
    
    init(name: String, position: Int, status: Bool) {
        self.name = name
        self.position = position
        self.status = status
    }
    
    func playerName () -> String {
        return name
    }
}
