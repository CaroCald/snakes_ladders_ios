//
//  SnakesAndLaddersTestMovements.swift
//  SnakesAndLaddersTests
//
//  Created by Carolina Calderon on 27/6/23.
//

import XCTest
@testable import SnakesAndLadders

final class SnakesAndLaddersTestMovements: XCTestCase {
    var game : Game? = nil


    func testMoveOnBoardToSnakeOfOnePlayer() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 91)
        
        
        let playerPosition = game?.players[0].position

      // then
      XCTAssertEqual(playerPosition, 88)
    }

    
    func testMoveOnBoardToLadderfOnePlayer() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 27)
        
        
        let playerPosition = game?.players[0].position
        

      // then
      XCTAssertEqual(playerPosition, 84)
    }
}
