//
//  SnakesAndLaddersTests.swift
//  SnakesAndLaddersTests
//
//  Created by Carolina Calderon on 16/5/23.
//

import XCTest
@testable import SnakesAndLadders

final class SnakesAndLaddersTests: XCTestCase {
    var game : Game? = nil
    
    
    func testStartGamePositionPlayer() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        let playerPosition = game?.players[0].position ?? 0
        game?.moveOnBoard(spaces: playerPosition)
        let playerToken = game?.players[0].token
        

      // then
      XCTAssertEqual(playerToken, 1)
    }
    
    func testPositionPlayerMovedTo4() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        let playerPosition = game?.players[0].position ?? 0
        game?.moveOnBoard(spaces: playerPosition)
        game?.moveOnBoard(spaces: 3)
        let playerPositionEnd = game?.players[0].token
      // then
      XCTAssertEqual(playerPositionEnd, 4)
    }
    
    func testPositionPlayerMovedTo8() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 0)
        game?.moveOnBoard(spaces: 3)
        game?.moveOnBoard(spaces: 4)
        let playerPositionEnd = game?.players[0].token
      // then
      XCTAssertEqual(playerPositionEnd, 8)
    }
    
    func testPlayerCanWin() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 0)
        game?.moveOnBoard(spaces: 97)
        game?.moveOnBoard(spaces: 4)

     
        let status = game?.players[0].status
      // then
      XCTAssertEqual(status, true)
    }
    
    func testPlayerCanWinWith4() {
      // given
        game = Game(players: [Player(name: "Jugador 1", position: 0, status: false)], dice: Dice(), board: Board(rows: 10, columns: 10))
       
      // when
        game?.startGame()
        game?.moveOnBoard(spaces: 0)
        game?.moveOnBoard(spaces: 97)
        game?.moveOnBoard(spaces: 4)

     
        let status = game?.players[0].status
      // then
      XCTAssertEqual(status, true)
    }
    
    

}
