//
//  SnakesAndLaddersTestWinGame.swift
//  SnakesAndLaddersTests
//
//  Created by Carolina Calderon on 29/6/23.
//

import XCTest
@testable import SnakesAndLadders

final class SnakesAndLaddersTestWinGame: XCTestCase {
    var game : Game? = nil

    func testPlayerCanWinInSquare100() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 96)
        XCTAssertEqual(game?.players[0].position, 97)
        game?.moveOnBoard(spaces: 3)
        XCTAssertEqual(game?.players[0].position, 100)
     
        let status = game?.players[0].status
      // then
      XCTAssertEqual(status, true)
    }
    
    func testPlayerNotWinInSquare97() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 96)
        XCTAssertEqual(game?.players[0].position, 97)
        game?.moveOnBoard(spaces: 4)
        XCTAssertEqual(game?.players[0].position, 97)
     
        let status = game?.players[0].status
        
      // then
      XCTAssertEqual(status, false)
    }
    
}
