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
    var numberOfMovements : Int = 0
    var requiredMovements : Int = 0
    var typeOfFigure: TypeOfFigure = TypeOfFigure.normal
    
    init(name: String, status: Bool) {
        self.name = name
        self.status = status
    }
    
    func playerName () -> String {
        return name
    }
}
