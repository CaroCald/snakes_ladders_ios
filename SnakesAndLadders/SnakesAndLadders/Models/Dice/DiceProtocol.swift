//
//  DiceProtocol.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 1/8/23.
//

import Foundation
protocol DiceProtocol {
    var numberFaces : Int {get}
    func rollDice() throws ->  Int
}
