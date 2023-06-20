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
    
    init(rows: Int, columns: Int) {
        
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
      
        addSnakes(snakes: [
            Snake(initPosition: 47, endPosition: 26),
            Snake(initPosition: 64, endPosition: 60),
            Snake(initPosition: 56, endPosition: 53),
            Snake(initPosition: 93, endPosition: 73),
            Snake(initPosition: 98, endPosition: 78)])
        addLadder(ladders: [
            Ladder(initPosition: 4, endPosition: 14),
            Ladder(initPosition: 9, endPosition: 31),
            Ladder(initPosition: 21, endPosition: 42),
            Ladder(initPosition: 51, endPosition: 67),
            Ladder(initPosition: 91, endPosition: 71),
            Ladder(initPosition: 80, endPosition: 99)])
        
    }
    
    mutating func addSnakes(snakes : Array<Snake>) {
        self.snakes = snakes
        for sn in snakes {
            grid[sn.endPosition] = sn.endPosition
            grid[sn.initPosition] = sn.initPosition
        }
    }
    
    mutating func addLadder(ladders : Array<Ladder>) {
        self.ladders = ladders
        for ldr in ladders {
            grid[ldr.endPosition] = ldr.endPosition
            grid[ldr.initPosition] = ldr.initPosition
        }
    }
    
    func whereToMove(position : Int) -> Int{
        var moveToPostion = position
        for lad in ladders {
            if grid[position] == lad.initPosition {
                moveToPostion = lad.endPosition
            }
        }
        
        for sn in snakes {
            if grid[position] == sn.endPosition {
                moveToPostion = sn.initPosition
            }
        }
        return moveToPostion
    }
}

