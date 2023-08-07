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
    
    
    fileprivate func validateProbability(_ arrayPosibleNumbers: [Int], _ numberRange: ClosedRange<Int>) {
        let countedSet = NSCountedSet(array: arrayPosibleNumbers)
        var countedDataInArray = 0
        for numbersInArray in numberRange {
            
            let totalNumberRepeats = countedSet.count(for: numbersInArray)
            countedDataInArray += totalNumberRepeats
            switch numbersInArray {
            case 1:
                XCTAssertEqual(Double(totalNumberRepeats)/100.0, 1/6.0, accuracy: 0.1);
            case 2:
                XCTAssertEqual(Double(totalNumberRepeats)/100.0, 1/6.0, accuracy: 0.1);
            case 3:
                XCTAssertEqual(Double(totalNumberRepeats)/100.0, 1/6.0, accuracy: 0.1);
            case 4:
                XCTAssertEqual(Double(totalNumberRepeats)/100.0, 1/6.0, accuracy: 0.1);
            case 5:
                XCTAssertEqual(Double(totalNumberRepeats)/100.0, 1/6.0, accuracy: 0.1);
            case 6:
                XCTAssertEqual(Double(totalNumberRepeats)/100.0, 1/6.0, accuracy: 0.1);
            default:
                print("No hay ese valor")
            }
        }
    }
    
    fileprivate func validateIsInRange(_ arrayPosibleNumbers: [Int], _ numberRange: ClosedRange<Int>) {
        var isInRange = false
        for elements in arrayPosibleNumbers {
            isInRange = numberRange.contains(elements)
            XCTAssertTrue(isInRange)
        }
    }
    
    func testValueDiceRoll() {
        
        var numberDice = 1
        var arrayPosibleNumbers = [Int]()
        let totalDataToTest = 100
        
        let numberRange = 1...6
        
        for _ in 1...totalDataToTest {
            numberDice = Dice().rollDice()
            arrayPosibleNumbers.append(numberDice)
        }
        
        validateIsInRange(arrayPosibleNumbers, numberRange)
        validateProbability(arrayPosibleNumbers, numberRange)
        
    }
    
    
    func testMockDice() {
        let mockDice = DiceMock(rolls: [4,5,6,1])
        XCTAssertEqual(try? mockDice.rollDice(), 4)
        XCTAssertEqual(try? mockDice.rollDice(), 5)
        XCTAssertEqual(try? mockDice.rollDice(), 6)
        XCTAssertEqual(try? mockDice.rollDice(), 1)
    }
    
    
    func testRollTwoDices() {
        let mockDice = DicesList(dices: [DiceMock(rolls: [3, 1]), DiceMock(rolls: [3, 8])])
        
        XCTAssertEqual(try? mockDice.rollDice(), 6)
        XCTAssertEqual(try? mockDice.rollDice(), 9)
    }

    
    func testRollTwoDicesBeInRange() {
        let mockDice = DicesList(dices: [Dice(), Dice()])
        
        var numberDice = 1
        var arrayPosibleNumbers = [Int]()
        let totalDataToTest = 100
        
        let numberRange = 2...12
        
        for _ in 1...totalDataToTest {
            numberDice = try! mockDice.rollDice()
            arrayPosibleNumbers.append(numberDice)
        }
        
        validateIsInRange(arrayPosibleNumbers, numberRange)
        
    }
}
