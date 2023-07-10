//
//  Board.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 17/5/23.
//

import Foundation

struct Board {
    
    let rows: Int
    let columns: Int
    var snakes : Array<Snake>
    var ladders: Array<Ladder>
    var grid: [Int]
    var typeOfFigure: TypeOfFigure = TypeOfFigure.normal
    
    private init(rows: Int, columns: Int, snakes : Array<Snake>, ladders: Array<Ladder>) {
        
        self.rows = rows
        self.columns = columns
        self.snakes = snakes
        self.ladders = ladders
        
        let boardSize =  rows * columns
        grid = Array(repeating: 0, count: boardSize)
       
        addSnakes(snakes: snakes)
        addLadder(ladders: ladders)
        
    }
    
    static func create(rows: Int, columns: Int, snakes : Array<Snake>, ladders: Array<Ladder>) throws -> Board {
        
        let rowsValid = try guardValidBoard(value: rows, alert: "Error inicializando el tablero")
        
        let columnsValid = try guardValidBoard(value: columns, alert: "Error inicializando el tablero")
        
        let validSnakes = try guardValidSnake(snakes: snakes, boardZise: (rowsValid*columnsValid), alert: "Error inicializando serpientes")
        
        let validLadder = try guardValidLadder(ladder: ladders, boardZise: (rowsValid*columnsValid), alert: "Error inicializando escaleras")
        
        return Board(rows: rowsValid, columns: columnsValid, snakes: validSnakes, ladders: validLadder)
    }
    
   
    mutating func addSnakes(snakes : Array<Snake>) {
      
        for sn in snakes {
            grid[sn.endPosition-1] = sn.endPosition
            grid[sn.initPosition-1] = sn.initPosition
        }
    }
    
    mutating func addLadder(ladders : Array<Ladder>) {
        
        for ldr in ladders {
            grid[ldr.endPosition-1] = ldr.endPosition
            grid[ldr.initPosition-1] = ldr.initPosition
        }
    }
    
    
    mutating func whereToMove(position : Int, player:Player) -> Int{
        var moveToPostion = position
        
        player.typeOfFigure = TypeOfFigure.normal
        
        for lad in ladders {
            if position == lad.endPosition {
                moveToPostion = lad.endPosition
                player.typeOfFigure = lad.typeOfFigure
            }
            if position == lad.initPosition {
                moveToPostion = lad.endPosition
                player.typeOfFigure = lad.typeOfFigure
            }
           
        }
        
        for sn in snakes {
            if position == sn.initPosition {
                moveToPostion = sn.endPosition
                player.typeOfFigure = sn.typeOfFigure
            }
            if position == sn.endPosition {
                moveToPostion = sn.endPosition
                player.typeOfFigure = sn.typeOfFigure
            }
            
        }
        if position == 0 {
            moveToPostion = 1
        }
        return moveToPostion
    }
    
}

