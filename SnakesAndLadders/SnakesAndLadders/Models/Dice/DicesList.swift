//
//  DicesList.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 1/8/23.
//

import Foundation

class DicesList: DiceProtocol {
    
    var numberFaces: Int = 6
    var dices : [DiceProtocol]
    var currentIndex : Int = -1
    
    
    init(dices: [DiceProtocol]) {
        self.dices = dices
    }
    
    func validateRollsInDice() throws -> Int {
        var finalValueDice = 0
        for dices in dices {
            finalValueDice += try dices.rollDice()
        }
        return finalValueDice
    }
        
    func rollDice() throws -> Int {
        return try validateRollsInDice()
    }
}
