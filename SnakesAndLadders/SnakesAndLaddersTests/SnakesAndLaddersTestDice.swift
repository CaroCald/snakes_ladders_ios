//
//  SnakesAndLaddersTestDice.swift
//  SnakesAndLaddersTests
//
//  Created by Carolina Calderon on 27/6/23.
//

import XCTest
@testable import SnakesAndLadders

final class SnakesAndLaddersTestDice: XCTestCase {
    var game : Game? = nil

    func testValueDiceRoll() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        let numberDice = game?.dice.rollDice()
     
        let numberRange = 1...6
        var isInRange = false
        
       isInRange = numberRange.contains(numberDice!)

      // then
      XCTAssertEqual(isInRange, true)
    }
    
    func testPlayerMoveTo4ByDice() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        let numberDice = 4
        game?.moveOnBoard(spaces: numberDice)

     
        let spaces = game?.numberOfMovemments
      // then
      XCTAssertEqual(spaces, 4)
    }

}
