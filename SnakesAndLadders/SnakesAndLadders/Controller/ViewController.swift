//
//  ViewController.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 16/5/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelPositionPlayer: UILabel!
    var game : Game? = nil
    var numberOfPlayers = 2
    var infoGame = ""

    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelMovements: UILabel!
    @IBOutlet weak var playerInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startGamePressed(_ sender: UIButton) {
        numberOfPlayers = Int(playerInput.text ?? "2") ?? 2

        game = Game(players: [], dice: Dice(), board: Board(rows: 10, columns: 10))
        
        for i in 1...numberOfPlayers {
            game!.players.append(Player(name: "Jugador \(i)", position: 0, status: false))
        }
        if game != nil {
            game!.startGame()
            game!.moveOnBoard(spaces: 0)
            labelStatus.text = "Juego iniciado"
        }
       
    }
    
    @IBAction func rollDicePressed(_ sender: UIButton) {

        if game != nil {
            if !game!.statusGame() {
                game!.moveOnBoard()
                
                for player in game!.players {
                    infoGame += "\(player.playerName()) se debe moverse \(game!.numberOfMovemments) espacios y se encuentra en la posicion \(player.position) y cayo en una \(game!.board.typeOfFigure) \n "
                    
                   print(infoGame)
                   infoGame = ""
                }

            } else {
                let founded = game?.players.first(where: { player in
                    player.status == true
                })
                let winGame = "El \(founded!.name) GANÓ!!! y necesito de \(game?.neededMovemmentsToWin ?? 0) movimientos"
                labelStatus.text = winGame
                print(winGame)
            }
            
        }
        else {
            labelStatus.text = "Empieza el juego para tirar el dado"
        }
    }
}

