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
    var hasPlayerWin : Bool
    var token: Int = 0
    var steps : Int = 0
    var requiredMovements : Int = 0
    var listOfMovements = [Int]()
    var typeOfFigure: TypeOfFigure = TypeOfFigure.normal
    var currentIndex : Int = -1
    
    init(name: String, hasPlayerWin: Bool) {
        self.name = name
        self.hasPlayerWin = hasPlayerWin
    }
    
    init(name: String, hasPlayerWin: Bool, listOfMovements : [Int]) {
        self.name = name
        self.hasPlayerWin = hasPlayerWin
        self.listOfMovements = listOfMovements
    }
    
    func playerName () -> String {
        return name
    }
    
    func getStepByListOfMovements() throws -> Int {
        currentIndex += 1
        if currentIndex >= listOfMovements.count {
            throw CustomErrors.customError(message: "Error fuera de rango en lista de movimientos de un jugador")
        }
        return listOfMovements[currentIndex]
    }
    
 
}
