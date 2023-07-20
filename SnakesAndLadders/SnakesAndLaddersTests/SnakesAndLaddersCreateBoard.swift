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
    
    func testCreateBoardWithNoRows() {
        var  hasError : Bool = false
        do { // given
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 0, columns: 10, snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTest))
            game?.startGame()
            
        } catch CustomErrors.customError(let errorMessage){
            hasError = true
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertEqual(hasError, true)
    }
    
    
    func testCreateBoardWithInvalidSnakes() {
        var  hasError : Bool = false
        do { // given
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTestWithError, ladders: TestValues.arrayladdersTest))
            game?.startGame()
            
        } catch CustomErrors.customError(let errorMessage){
            hasError = true
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertEqual(hasError, true)
    }
    
    
    func testCreateBoardWithInvalidLadder() {
        var  hasError : Bool = false
        do { // given
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTestWithError))
            game?.startGame()
            
        } catch CustomErrors.customError(let errorMessage){
            hasError = true
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertEqual(hasError, true)
    }
    func testCreateBoardWithLadderInit() {
        var  hasError : Bool = false
        do { // given
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTest, ladders: TestValues.arrayladdersTestWithErrorInit))
            game?.startGame()
            
        } catch CustomErrors.customError(let errorMessage){
            hasError = true
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertEqual(hasError, true)
    }
    func testCreateBoardWithSnakeInit() {
        var  hasError : Bool = false
        do { // given
            game = try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakesTestWithErrorInit, ladders: TestValues.arrayladdersTest))
            game?.startGame()
            
        } catch CustomErrors.customError(let errorMessage){
            hasError = true
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertEqual(hasError, true)
    }
}
