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
        for player in players {
            moveOnBoard(spaces: player.position, player:player)
        }
    }
    
    mutating func addPlayers(numberOfPlayers : Int){
        for i in 1...numberOfPlayers {
            players.append(Player(name: "Jugador \(i)", status: false))
        }
    }
    mutating func printBoard(){
        print(board.grid)
    }
    
    func statusGame () -> Bool {
        return statusWining
        
    }
    
    mutating func validateLaddersAndSnakes(newPosition : Int, player:Player ){
        var initialPosition =  newPosition
        let positionToMove = board.whereToMove(position: newPosition, player: player )
        board.grid[positionToMove] = 1
        player.position = positionToMove
        if initialPosition == 0 {
            initialPosition = 1
        }
        player.token = initialPosition
        
    }
    
    mutating func moveOnBoard(spaces : Int, player:Player) {
        
        neededMovemmentsToWin+=1
       // board.grid[player.position] = 0
        
        if player.status == false && statusWining == false {
            numberOfMovemments = spaces
            player.numberOfMovements = spaces
            let newPosition = spaces + player.position
            
            if newPosition >= (board.columns * board.rows) {
                if newPosition == (board.columns * board.rows){
                    statusWining = true
                    player.status = true
                    player.position = newPosition
                    player.typeOfFigure = TypeOfFigure.normal
                }
                
            } else {
                
                if player.position != 0 {
                    player.position = newPosition
                    if newPosition <= board.columns * board.rows {
                        validateLaddersAndSnakes(newPosition: newPosition, player: player)
                    }
                } else {
                    player.position = numberOfMovemments
                    validateLaddersAndSnakes(newPosition: newPosition, player: player)
                }
                
            }
            
            infoGame += "\(player.playerName()) se debe moverse \( player.numberOfMovements) espacios y se encuentra en la posicion \(player.position) y  cayo en una \(player.typeOfFigure)\n "
            
            print(infoGame)
            infoGame = ""
        }
        
        
    }
}
