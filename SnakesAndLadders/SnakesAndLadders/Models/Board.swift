//
//  Board.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 17/5/23.
//

import Foundation

struct Board {
    
    let rows: Int, columns: Int
    var snakes : Array<Snake> = []
    var ladders: Array<Ladder> = []
    var grid: [Int]
    var typeOfFigure = TypeOfFigure.normal
    
    init(rows: Int, columns: Int) {
        
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
      
        addSnakes(snakes: [
            Snake(initPosition: 16, endPosition: 6),
            Snake(initPosition: 49, endPosition: 11),
            Snake(initPosition: 62, endPosition: 19),
            Snake(initPosition: 64, endPosition: 60),
            Snake(initPosition: 74, endPosition: 53),
            Snake(initPosition: 89, endPosition: 68),
            Snake(initPosition: 99, endPosition: 80),
            Snake(initPosition: 95, endPosition: 75),
            Snake(initPosition: 92, endPosition: 88)])
        
        addLadder(ladders: [
            Ladder(initPosition: 2, endPosition: 38),
            Ladder(initPosition: 15, endPosition: 26),
            Ladder(initPosition: 7, endPosition: 14),
            Ladder(initPosition: 21, endPosition: 42),
            Ladder(initPosition: 36, endPosition: 44),
            Ladder(initPosition: 28, endPosition: 84),
            Ladder(initPosition: 51, endPosition: 67),
            Ladder(initPosition: 71, endPosition: 91),
            Ladder(initPosition: 78, endPosition: 98),
            Ladder(initPosition: 8, endPosition: 31)])
        
    }
    
    mutating func addSnakes(snakes : Array<Snake>) {
        self.snakes = snakes
        for sn in snakes {
            grid[sn.endPosition-1] = sn.endPosition
            grid[sn.initPosition-1] = sn.initPosition
        }
    }
    
    mutating func addLadder(ladders : Array<Ladder>) {
        self.ladders = ladders
        for ldr in ladders {
            grid[ldr.endPosition-1] = ldr.endPosition
            grid[ldr.initPosition-1] = ldr.initPosition
        }
    }
   
    
    mutating func whereToMove(position : Int) -> Int{
        var moveToPostion = position
        self.typeOfFigure = TypeOfFigure.normal
        for lad in ladders {
            if position == lad.endPosition {
                moveToPostion = lad.endPosition
                self.typeOfFigure = lad.typeOfFigure
            }
            if position == lad.initPosition {
                moveToPostion = lad.endPosition
                self.typeOfFigure = lad.typeOfFigure
            }
           
        }
        
        for sn in snakes {
            if position == sn.initPosition {
                moveToPostion = sn.endPosition
                self.typeOfFigure = sn.typeOfFigure
            }
            if position == sn.endPosition {
                moveToPostion = sn.endPosition
                self.typeOfFigure = sn.typeOfFigure
            }
            
        }
        if position == 0 {
            moveToPostion = 1
        }
        return moveToPostion
    }
    
}

