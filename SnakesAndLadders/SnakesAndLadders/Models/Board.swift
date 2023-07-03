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
    var typeOfFigure = TypeOfFigure.normal
    
    init(rows: Int, columns: Int, snakes : Array<Snake>, ladders: Array<Ladder>) {
        
        self.rows = rows
        self.columns = columns
        self.snakes = snakes
        self.ladders = ladders
        
        grid = Array(repeating: 0, count: rows * columns)
      
        addSnakes(snakes: snakes)
        
        addLadder(ladders: ladders)
        
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
    
    func getTypeFigure() -> TypeOfFigure {
        return self.typeOfFigure
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

