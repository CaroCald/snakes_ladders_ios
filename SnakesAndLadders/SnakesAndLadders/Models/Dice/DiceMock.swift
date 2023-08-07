//
//  DiceMock.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 1/8/23.
//

import Foundation
class DiceMock : DiceProtocol  {
    let numberFaces = 6
    var rolls : [Int]
    var currentIndex : Int = -1
    
    init(rolls: [Int]) {
        self.rolls = rolls
    }
    
    func rollDice() throws -> Int {
        currentIndex += 1
        if currentIndex >= rolls.count {
            throw CustomErrors.customError(message: "Error fuera de rango movimientos de dado")
        }
        return rolls[currentIndex]
    }
    
}



