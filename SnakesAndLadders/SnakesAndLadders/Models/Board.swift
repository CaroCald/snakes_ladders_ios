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
    
    public static func create(rows: Int, columns: Int, snakes : Array<Snake>, ladders: Array<Ladder>) throws -> Board {
        
        let rowsValid = try guardValidBoard(value: rows, alert:Constants.errorBoard)
        
        let columnsValid = try guardValidBoard(value: columns, alert: Constants.errorBoard)
        
        let validSnakes = try guardValidSnake(snakes: snakes, boardZise: (rowsValid*columnsValid), alert: Constants.errorSnakesInit)
        
        let validLadder = try guardValidLadder(ladder: ladders, boardZise: (rowsValid*columnsValid), alert: Constants.errorLadderInit)
        
        return Board(rows: rowsValid, columns: columnsValid, snakes: validSnakes, ladders: validLadder)
    }
    
   
    private mutating func setFigurePositions(_ figure: Figure) {
        grid[figure.endPosition-1] = figure.endPosition
        grid[figure.initPosition-1] = figure.initPosition
    }
    
    mutating func addSnakes(snakes : Array<Snake>) {
      
        for sn in snakes {
            setFigurePositions(sn)
        }
    }
    
    mutating func addLadder(ladders : Array<Ladder>) {

        for ldr in ladders {
            setFigurePositions(ldr)
        }
    }
    
  
    private func validateFigure(_ position: Int, _ figures: Array<Figure>, _ moveToPostion: inout Int, _ player: Player) {
        for figure in figures {
            if position == figure.initPosition {
                moveToPostion = figure.endPosition
                player.typeOfFigure = figure.typeOfFigure
            }
        }
       
    }
    
    mutating func whereToMove(position : Int, player:Player) -> Int{
        var moveToPostion = position
        
        player.typeOfFigure = TypeOfFigure.normal
        //
        validateFigure(position, snakes, &moveToPostion, player)
        //
        validateFigure(position, ladders, &moveToPostion, player)

        return moveToPostion
    }
    
}

