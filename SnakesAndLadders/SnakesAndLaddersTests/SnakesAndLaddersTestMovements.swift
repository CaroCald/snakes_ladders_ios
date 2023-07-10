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
        do {
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10,  snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // when
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 91, player: player)
            }
            
            
            let playerPosition = game?.players[0].position
            
            // then
            XCTAssertEqual(playerPosition, 88)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testMoveOnBoardToLadderfOnePlayer() {
        do {
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10,  snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTest))
            
            // when
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 91, player: player)
            }
            
            
            let playerPosition = game?.players[0].position
            
            // then
            XCTAssertEqual(playerPosition, 88)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    func testLaddersInitFinalPosition() {
        do {
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // when
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 1, player: player)
                
            }
            let playerPosition = game?.players[0].position
            XCTAssertEqual(playerPosition, 38)
            
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func testSnakesInitFinalPosition() {
        do {
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // when
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 15, player: player)
                
            }
            let playerPosition = game?.players[0].position
            XCTAssertEqual(playerPosition, 6)
            
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
}
