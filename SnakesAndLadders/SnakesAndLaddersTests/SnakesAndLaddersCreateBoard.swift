//
//  SnakesAndLaddersCreateBoard.swift
//  SnakesAndLaddersTests
//
//  Created by bayteq on 10/7/23.
//

import XCTest
@testable import SnakesAndLadders
final class SnakesAndLaddersCreateBoard: XCTestCase {

    var game : Game? = nil
    let playerTest: Player = Player(name: "Jugador 1", hasPlayerWin: false)
    func testCreateBoardWithNoRows() {
        
        do { // given
            
            game = try Game(players: [playerTest], diceProtocol: Dice(), board: Board.create(rows: 0, columns: 10, snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTest))
        
            
        } catch CustomErrors.customError(let errorMessage){
            XCTAssertEqual(errorMessage, Constants.errorBoard)
        } catch {
            print(error.localizedDescription)
        }
        
       
    }
    
    
    func testCreateBoardWithInvalidSnakes() {
        do { // given
            game = try Game(players: [playerTest], diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTestWithError, ladders: TestValues.arrayladdersTest))
         
            
        } catch CustomErrors.customError(let errorMessage){
           
            XCTAssertEqual(errorMessage, Constants.errorSnakesInit)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    func testCreateBoardWithInvalidLadder() {
       
        do { // given
            game = try Game(players: [playerTest], diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTestWithError))
          
            
        } catch CustomErrors.customError(let errorMessage){
            XCTAssertEqual(errorMessage, Constants.errorLadderInit)
        } catch {
            print(error.localizedDescription)
        }
        
     
    }
    func testCreateBoardWithLadderInit() {
       
        do { // given
            game = try Game(players: [playerTest], diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTestWithErrorInit))
           
            
        } catch CustomErrors.customError(let errorMessage){
            XCTAssertEqual(errorMessage, Constants.errorLadderInitBoard)
        } catch {
            print(error.localizedDescription)
        }
       
    }
    func testCreateBoardWithSnakeInit() {
       
        do { // given
            game = try Game(players: [playerTest], diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTestWithErrorInit, ladders: TestValues.arrayladdersTest))
            
            
        } catch CustomErrors.customError(let errorMessage){
            XCTAssertEqual(errorMessage, Constants.errorSnakesInitBoard)

        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    
    func testBoardSize() {
       
        do { // given
            game = try Game(numberOfPlayers: 1, diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            let size = game?.board.grid.count
            XCTAssertEqual(size, 100)

            
        } catch CustomErrors.customError(let errorMessage){
            print(errorMessage)

        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    func testBoardWithBadSize() {
        XCTAssertThrowsError(try Game(numberOfPlayers: 1, diceProtocol: Dice(), board: Board.create(rows: 10, columns: 9, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders)))

        
    }

}
