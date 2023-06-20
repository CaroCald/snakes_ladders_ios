//
//  Game.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import Foundation

struct Game {
    var players : Array<Player>
    var dice : Dice
    var board : Board
    var statusWining : Bool = false
    
    init(players: Array<Player>, dice: Dice, board: Board) {
        self.players = players
        self.dice = dice
        self.board = board
    }
    
    mutating func startGame(){
        board = Board(rows: 10, columns: 10)
        statusWining = false
    }
    
    mutating func printBoard(){
        print(board.grid)
    }
    
    func statusGame () -> Bool {
        return statusWining
        
    }
    
   
    mutating func validateLaddersAndSnakes(newPosition : Int){
        
        let positionToMove = board.whereToMove(position: newPosition)
        board.grid[positionToMove] = 1
        for player in players {
            player.position = positionToMove
        }
       

    }
    
    mutating func moveOnBoard(numberOfMovemments : Int) {
        for player in players {
            board.grid[player.position] = 0
            let newPosition = numberOfMovemments + player.position
           
            if newPosition >= (board.columns * board.rows) {
                statusWining = true
                player.status = true
                
            } else {
              
                if player.position != 0 {
                    player.position = newPosition
                    if newPosition <= board.columns * board.rows {
                        validateLaddersAndSnakes(newPosition: newPosition)
                                           
                    }
                } else {
                    player.position = numberOfMovemments
                    validateLaddersAndSnakes(newPosition: newPosition)
                }
                
            }
        }
       
       
    }
}
