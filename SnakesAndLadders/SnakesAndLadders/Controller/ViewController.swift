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

    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelMovements: UILabel!
    @IBOutlet weak var playerInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func startGamePressed(_ sender: UIButton) {
    
        let name = playerInput.text
        game = Game(player: Player(name: name ?? "PlayerX", position: 0), dice: Dice(), board: Board(rows: 10, columns: 10))
        
        if game != nil {
            game!.startGame()
            game!.moveOnBoard(numberOfMovemments: game!.player.position)
            labelPositionPlayer.text =
            "El jugador \(game!.player.playerName()) se encuentra en la posicion \(game!.player.position)"
            labelStatus.text = "Juego iniciado"
            game!.printBoard()
        }
       
    }
    
    @IBAction func rollDicePressed(_ sender: UIButton) {
        if game != nil {
            
            if game!.statusGame() {
                labelStatus.text = "El jugador \(game!.player.playerName()) GANÓ!!!"
            } else {
                let movements = game!.dice.rollDice()
                labelMovements.text = "El jugador \(game!.player.playerName()) debe moverse \(movements) espacios"
                game!.moveOnBoard(numberOfMovemments: movements)
                labelPositionPlayer.text = "El jugador \(game!.player.playerName()) se encuentra en la posicion \(game!.player.position)"
                game!.printBoard()
            }
            
        }
        else {
            labelStatus.text = "Empieza el juego para tirar el dado"
        }
    }
    
}

