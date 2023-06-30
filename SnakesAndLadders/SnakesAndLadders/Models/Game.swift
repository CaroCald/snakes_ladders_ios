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
    var infoGame = ""
    var numberOfMovemments : Int = 0
    var neededMovemmentsToWin : Int = 0
    
    init(players: Array<Player>, dice: Dice, board: Board) {
        self.players = players
        self.dice = dice
        self.board = board
    }
    
    mutating func startGame(){
        statusWining = false
        neededMovemmentsToWin = 0
        moveOnBoard(spaces: 0)
    }
    
    mutating func printBoard(){
        print(board.grid)
    }
    
    func statusGame () -> Bool {
        return statusWining
        
    }
    
    mutating func validateLaddersAndSnakes(newPosition : Int){
        var initialPosition =  newPosition
        let positionToMove = board.whereToMove(position: newPosition)
        board.grid[positionToMove] = 1
        for player in players {
            player.position = positionToMove
            if initialPosition == 0 {
                initialPosition = 1
            }
            player.token = initialPosition
        }

    }
    
    mutating func moveOnBoard(spaces : Int? = nil) {
        
        neededMovemmentsToWin+=1
        
        for player in players {
            board.grid[player.position] = 0
            if player.status == false && statusWining == false {
               
                if spaces == nil {
                    numberOfMovemments = self.dice.rollDice()
                }else{
                    numberOfMovemments = spaces!
                }
                
                let newPosition = numberOfMovemments + player.position
               
                if newPosition >= (board.columns * board.rows) {
                    if newPosition == (board.columns * board.rows){
                        statusWining = true
                        player.status = true
                        player.position = newPosition
                    }
                    
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
                
                infoGame += "\(player.playerName()) se debe moverse \(numberOfMovemments) espacios y se encuentra en la posicion \(player.position) y cayo en una \(board.getTypeFigure()) \n "
                
               print(infoGame)
               infoGame = ""
            }
            
          
        }
    }
}
