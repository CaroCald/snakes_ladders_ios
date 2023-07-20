//
//  TestValues.swift
//  SnakesAndLaddersTests
//
//  Created by bayteq on 30/6/23.
//

import Foundation
struct TestValues {
    
    static let arrayladders: Array<Ladder> = [
        Ladder(initPosition: 2, endPosition: 38),
        Ladder(initPosition: 15, endPosition: 26),
        Ladder(initPosition: 7, endPosition: 14),
        Ladder(initPosition: 21, endPosition: 42),
        Ladder(initPosition: 36, endPosition: 44),
        Ladder(initPosition: 28, endPosition: 84),
        Ladder(initPosition: 51, endPosition: 67),
        Ladder(initPosition: 71, endPosition: 91),
        Ladder(initPosition: 78, endPosition: 98),
        Ladder(initPosition: 8, endPosition: 31)]
    
    static let arraySnakes: Array<Snake>  = [
        Snake(initPosition: 6, endPosition: 16),
        Snake(initPosition: 49, endPosition: 11),
        Snake(initPosition: 62, endPosition: 19),
        Snake(initPosition: 64, endPosition: 60),
        Snake(initPosition: 74, endPosition: 53),
        Snake(initPosition: 89, endPosition: 68),
        Snake(initPosition: 99, endPosition: 80),
        Snake(initPosition: 95, endPosition: 75),
        Snake(initPosition: 92, endPosition: 88)]
    
    static let arrayladdersTest: Array<Ladder> = [
        Ladder(initPosition: 38, endPosition: 2),
        ]
    
    static let arraySnakesTest: Array<Snake>  = [
        Snake(initPosition: 16, endPosition: 6),
        ]
    
    static let arrayladdersTestWithError: Array<Ladder> = [
        Ladder(initPosition: 103, endPosition: 2),
        ]
    
    static let arraySnakesTestWithError: Array<Snake>  = [
        Snake(initPosition: -1, endPosition: 6),
        ]
    static let arrayladdersTestWithErrorInit: Array<Ladder>  = [
        Ladder(initPosition: 0, endPosition: 6),
        ]
    static let arraySnakesTestWithErrorInit: Array<Snake>  = [
        Snake(initPosition: 0, endPosition: 100),
        ]
    
    static var arrayOfPlayers = [Player(name: "Jugador 1", status: false),
                                 Player(name: "Jugador 2", status: false)]
    
    static var arrayOfPlayersThree = [Player(name: "Jugador 1",  status: false),
                                      Player(name: "Jugador 2",  status: false),
                                      Player(name: "Jugador 3", status: false)]
    
    static var arrayOfPlayersFour = [Player(name: "Jugador 1",  status: false),
                                      Player(name: "Jugador 2",  status: false),
                                      Player(name: "Jugador 3", status: false),
                                      Player(name: "Jugador 4", status: false)]
    
}
