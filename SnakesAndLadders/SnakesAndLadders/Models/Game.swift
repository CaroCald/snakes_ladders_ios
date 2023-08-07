//
//  Game.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import Foundation

class Game {
    
    var players : Array<Player>
    var diceProtocol : DiceProtocol
    var board : Board
    var statusGameWinning : Bool = false
    var infoGame = ""
    var turn = 0
    
    init(players: Array<Player>, diceProtocol: DiceProtocol, board: Board) {
        self.players = players
        self.diceProtocol = diceProtocol
        self.board = board
    }
    
    func startGame(){
        statusGameWinning = false
        for player in players {
            moveOnePlayerOnBoard(spaces: player.position+1, player:player)
        }
    }
    
    func addPlayers(numberOfPlayers : Int){
        for i in 1...numberOfPlayers {
            players.append(Player(name: "Jugador \(i)", status: false))
        }
    }
    func printInfoGame(player:Player){
        infoGame += "\(player.playerName()) se debe moverse \( player.steps) espacios y se encuentra en la posición \(player.position) y cayo en una \(player.typeOfFigure)\n "
        
        print(infoGame)
        infoGame = ""
    }
    
    func statusGame () -> Bool {
        return statusGameWinning
        
    }
        
    func getSelectedPlayer(numberOfPlayer : Int) -> Player {
        if(numberOfPlayer <= 0) {return players[0]}
        return players[numberOfPlayer-1]
    }
    
    func getNextTurn() -> Int {
        if turn >= players.count {
            turn = 0
        }
        return turn
    }
    
    func getNextPlayer() -> Player{
        return players[getNextTurn()]
    }
    
    func getWinner() -> Player {
        let foundedPlayer = players.first(where: { player in
            player.status == true
        })
        return foundedPlayer!
    }
    
    func playGame() throws {
        while gameIsNotOver() {
            moveOnePlayerOnBoard(spaces: try diceProtocol.rollDice(), player: getNextPlayer())
        }
    }
    
    func gameIsNotOver() -> Bool {
        return statusGameWinning == false
    }
    
    func giveAStep(_ spaces : Int, _ player:Player) -> Int {
        return spaces + player.position
    }
    
    private func validatePlayerWin(_ newPosition: Int, _ player: Player) {
        if newPosition == (board.columns * board.rows) {
            statusGameWinning = true
            player.status = true
            player.position = newPosition
            player.typeOfFigure = TypeOfFigure.normal
        }
    }
    
    func validateLaddersAndSnakes(_ newPosition : Int, _ player:Player ){
        player.position = board.whereToMove(position: newPosition, player: player )
        player.token = newPosition
    }
    
    func moveOnePlayerOnBoard(spaces : Int, player:Player) {
        
        player.steps = spaces
        player.requiredMovements += 1
        turn += 1
        
        let newPosition = giveAStep(spaces, player)
        
        if newPosition >= (board.columns * board.rows) {
            validatePlayerWin(newPosition, player)
        } else {
            validateLaddersAndSnakes(newPosition, player)
        }
        printInfoGame(player: player)
    }
    
}
