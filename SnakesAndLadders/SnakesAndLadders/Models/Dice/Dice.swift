//
//  Dice.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import Foundation

class Dice : DiceProtocol  {
    let numberFaces = 6
    
    private func generateRandom() -> Int {
        return Int.random(in: 1...numberFaces)
    }
    
    func rollDice () -> Int {
        return generateRandom()
    }
    
}

