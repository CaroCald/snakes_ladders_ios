//
//  Dice.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import Foundation

struct Dice {
    
    let numberFaces = 6
    
    func rollDice () -> Int{
        return Int.random(in: 1...numberFaces)
    }
    func rollDiceWithSetValue (defaultValue: Int ) -> Int{
        return defaultValue
    }
}
