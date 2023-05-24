//
//  Game.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import Foundation

struct Game {
    var player : Player
    var dice : Dice
    var board : Board
    var statusWining : Bool = false
    
    init(player: Player, dice: Dice, board: Board) {
        self.player = player
        self.dice = dice
        self.board = board
    }
    
    mutating func startGame(){
        board = Board(rows: 10, columns: 10)
        statusWining = false
    }
    
    func printBoard(){
        print(board)
    }
    
    func statusGame () -> Bool {
        return statusWining
        
    }
    
    mutating func moveOnBoard(numberOfMovemments : Int) {
        board.grid[player.position] = 0
        let newPosition = numberOfMovemments + player.position

        if newPosition >= (board.columns * board.rows) {
            statusWining = true
            
        } else {
            if player.position != 0 {
                player.position = newPosition
                if newPosition <= board.columns * board.rows {
                    board.grid[newPosition] = 1
                }
            } else {
                player.position = numberOfMovemments
                board.grid[numberOfMovemments] = 1
            }
        }
    
       
    }
}
