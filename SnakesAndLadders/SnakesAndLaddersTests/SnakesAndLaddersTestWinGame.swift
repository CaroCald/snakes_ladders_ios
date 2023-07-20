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
        
        do { // given
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // when
            game?.startGame()
            for player in game!.players {
                game?.moveOnBoard(spaces: 96, player: player)
                XCTAssertEqual(game?.players[0].position, 97)
                game?.moveOnBoard(spaces: 3, player: player)
                XCTAssertEqual(game?.players[0].position, 100)
            }
           
            
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
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // when
            game?.startGame()
            
            for player in game!.players {
                game?.moveOnBoard(spaces: 96, player: player)
                XCTAssertEqual(game?.players[0].position, 97)
                game?.moveOnBoard(spaces: 4, player: player)
                XCTAssertEqual(game?.players[0].position, 97)
            }
            
            let status = game?.players[0].status
            
            // then
            XCTAssertEqual(status, false)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
