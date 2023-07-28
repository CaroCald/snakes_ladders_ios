//
//  SnakesAndLaddersTestDice.swift
//  SnakesAndLaddersTests
//
//  Created by Carolina Calderon on 27/6/23.
//

import XCTest
@testable import SnakesAndLadders

final class SnakesAndLaddersTestDice: XCTestCase {
    var game : Game? = nil
    func createGame() throws -> Game {
       return try Game(players: [Player(name: "Jugador 1", status: false)], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
   }
    
    func testValueDiceRoll() {
        // given
        
        do {
            game = try createGame()
            
            // when
            game!.startGame()
            var numberDice = 1
            var arrayPosibleNumbers : [Int] = []
            let totalDataToTest = 100
            
            let numberRange = 1...6
            
            for _ in 1...totalDataToTest {
                numberDice = game!.dice.rollDice()
                arrayPosibleNumbers.append(numberDice)
            }
            
            var isInRange = false
            for elements in arrayPosibleNumbers {
                isInRange = numberRange.contains(elements)
                XCTAssertEqual(isInRange, true)
            }
            
            
            let countedSet = NSCountedSet(array: arrayPosibleNumbers)
            
            
            var countedDataInArray = 0
            for i in numberRange {
              
                let totalNumberRepeats = countedSet.count(for: i)
                countedDataInArray += totalNumberRepeats
                print("Valor \(i) --- veces repetido \(totalNumberRepeats)")
                
            }
           
            XCTAssertEqual(countedDataInArray, totalDataToTest)
            
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func testPlayerMoveTo4ByDice() {
        // given
        
        do {
            game = try createGame()
            
            // when
            game!.startGame()
            let numberDice = game!.dice.rollDiceWithSetValue(defaultValue: 4)
            for player in game!.players {
                game!.moveOnBoard(spaces: numberDice, player: player)
            }
            
            let spaces = game?.players[0].numberOfMovements
            // then
            XCTAssertEqual(spaces, 4)
        }catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
