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
    func createGame() throws -> Game {
       return try Game(players: [Player(name: "Jugador 1", status: false)], diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
   }
    
    func testPlayerCanWinInSquare100() {
        
        do { // given
            game = try createGame()
            
            // when
            game?.startGame()
            XCTAssertEqual(game?.players[0].position, 1)
            
            game?.moveOnePlayerOnBoard(spaces: 96, player: game!.getNextPlayer())
            XCTAssertEqual(game!.getNextPlayer().position, 97)
            game?.moveOnePlayerOnBoard(spaces: 3, player: game!.getNextPlayer())
            XCTAssertEqual(game!.getNextPlayer().position, 100)
            
            let status = game?.players[0].status
            // then
            XCTAssertEqual(status, true)
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testPlayerNotWinInSquare97() {
        // given
        
        do {
            game = try createGame()
            
            // when
            game?.startGame()
            
            XCTAssertEqual(game?.players[0].position, 1)
            
            game?.moveOnePlayerOnBoard(spaces: 96, player: game!.getNextPlayer())
            XCTAssertEqual(game?.getNextPlayer().position, 97)
            game?.moveOnePlayerOnBoard(spaces: 4, player: game!.getNextPlayer())
            XCTAssertEqual(game?.getNextPlayer().position, 97)
            
            
            let status = game?.players[0].status
            
            // then
            XCTAssertEqual(status, false)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testPlayerNotWinTwoPlayers() {
        // given
        
        do {
            game = try createGame()
            
            game!.addPlayers(numberOfPlayers: 2)
            game!.startGame()
            XCTAssertEqual(game?.players[0].position, 1)
            XCTAssertEqual(game?.players[1].position, 1)
            
            game!.moveOnePlayerOnBoard(spaces: 96, player: game!.getNextPlayer())
            game!.moveOnePlayerOnBoard(spaces: 99, player: game!.getNextPlayer())
            
            let status = game!.players[0].status
            let statusSecondPlayer = game!.players[1].status
            // then
            XCTAssertTrue(statusSecondPlayer)
            XCTAssertFalse(status)
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
