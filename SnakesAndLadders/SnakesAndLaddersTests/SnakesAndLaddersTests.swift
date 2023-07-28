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
    
    
     func createGame() throws -> Game {
        return try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
    }
    
    func testStartGamePositionPlayer() {
        do {
            game = try createGame()
            game?.startGame()
            let playerToken = game?.players[0].token
            
            XCTAssertEqual(playerToken, 1)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
    
    }
    
    func testPositionPlayerMovedTo4() {
        
        do {
            game =  try createGame()
            
            // when
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 3, player: player)
            }
            let playerPositionEnd = game?.players[0].token
            // then
            XCTAssertEqual(playerPositionEnd, 4)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func testPositionPlayerMovedTo8() {
        // given
        
        do {
            game =  try createGame()
            
            // when
            game?.startGame()
            
            for player in game!.players {
                game!.moveOnBoard(spaces: 3, player: player)
                game!.moveOnBoard(spaces: 4, player: player)
            }
            let playerPositionEnd = game?.players[0].token
            // then
            XCTAssertEqual(playerPositionEnd, 8)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testPositionTwoPlayers() {
        do {
            game = try Game(players: TestValues.arrayOfPlayers, dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // when
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 3, player: player)
            }
            
            let player1PositionEnd = game?.players[0].token
            let player2PositionEnd = game?.players[1].token
            
            
            XCTAssertEqual(player1PositionEnd, 4)
            XCTAssertEqual(player2PositionEnd, 4)
            
            
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testPositionThreePlayers() {
        do {
            game = try Game(players: TestValues.arrayOfPlayersThree, dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            game?.startGame()
            for player in game!.players {
                game!.moveOnBoard(spaces: 3, player: player)
            }
            
            
            let player1PositionEnd = game?.players[0].token
            let player2PositionEnd = game?.players[1].token
            let player3PositionEnd = game?.players[2].token
            
            XCTAssertEqual(player1PositionEnd, 4)
            XCTAssertEqual(player2PositionEnd, 4)
            XCTAssertEqual(player3PositionEnd, 4)
            
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
