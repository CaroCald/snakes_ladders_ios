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
    
    
    func createGame(diceProtocol :  DiceProtocol) throws -> Game {
        return try Game(players: [Player(name: "Jugador 1", status: false)], diceProtocol: diceProtocol, board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
    }
    
    func testInitPositionPlayerWhenGameStart() {
        do {
            game = try createGame(diceProtocol: Dice())
            game?.startGame()
            
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 1)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testPositionPlayerMovedTo4() {
        
        do {
            game =  try createGame(diceProtocol: DiceMock(rolls: [3]))
            
            game!.startGame()
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 1)
            
            game!.moveOnePlayerOnBoard(spaces: try game!.diceProtocol.rollDice(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 4)
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func testOnePlayersWithDiceRolls() {
        // given
        
        do {
            game =  try createGame(diceProtocol: DiceMock(rolls: [3,4]))
            
            game?.startGame()
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 1)
            
            //
            game?.moveOnePlayerOnBoard(spaces: try game!.diceProtocol.rollDice(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 4)
            
            
            //
            game?.moveOnePlayerOnBoard(spaces: try game!.diceProtocol.rollDice(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 8)
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testTwoPlayersWithListOfMovementsStepByStep() {
        do {
            
            game = try Game(players: TestValues.arrayOfTwoPlayersMockSteps, diceProtocol:  Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            
            // inicio
            game?.startGame()
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 1)
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 2).token, 1)
            
            
            //primer movimiento jugardor 1
            game?.moveOnePlayerOnBoard(spaces: try game!.getNextPlayer().getStepByListOfMovements(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 3)
            //primer movimiento jugardor 2
            game?.moveOnePlayerOnBoard(spaces: try game!.getNextPlayer().getStepByListOfMovements(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 2).token, 4)
            
            
            //segundo movimiento jugardor 1
            game?.moveOnePlayerOnBoard(spaces: try game!.getNextPlayer().getStepByListOfMovements(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 4)
            //segundo movimiento jugardor 2
            game?.moveOnePlayerOnBoard(spaces: try game!.getNextPlayer().getStepByListOfMovements(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 2).token, 9)
            
            //tercer movimiento jugardor 1
            game?.moveOnePlayerOnBoard(spaces: try game!.getNextPlayer().getStepByListOfMovements(),
                                       player: game!.getNextPlayer())
            XCTAssertEqual(game?.getSelectedPlayer(numberOfPlayer: 1).token, 9)
            
            
        } catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
