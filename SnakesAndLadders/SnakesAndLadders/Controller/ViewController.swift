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


    @IBAction func addPlayersPressed(_ sender: UIButton) {
        numberOfPlayers = Int(playerInput.text ?? "2") ?? 2
        game = Game(players: [], dice: Dice(), board: Board(rows: 10, columns: 10))
        for i in 1...numberOfPlayers {
            game!.players.append(Player(name: "Jugador \(i)", position: 0, status: false))
        }
        

    }
    @IBAction func startGamePressed(_ sender: UIButton) {
    
    
        for i in 1...numberOfPlayers {
            if game != nil {
                game!.startGame()
                game!.moveOnBoard(numberOfMovemments: game!.players[i-1].position)
                infoGame +=
                "El jugador \(game!.players[i-1].playerName()) se encuentra \n  en la posicion \(game!.players[i-1].position) \n "
                labelStatus.text = "Juego iniciado"
                print("================TABLERO==================")
                game!.printBoard()
                print("================MOVIMIENTOS==================")
                print(infoGame)
                infoGame = ""

            }
        }
       
    }
    
    @IBAction func rollDicePressed(_ sender: UIButton) {

        if game != nil {
          
            if !game!.statusGame() {
                for i in 1...numberOfPlayers {
                    if game!.players[i-1].status {
                        let winGame = "El jugador \(game!.players[i-1].playerName()) GANÓ!!!"
                        labelStatus.text = winGame
                        print(winGame)
                    } else {
                        let movements = game!.dice.rollDice()
                        infoGame += "El jugador \(game!.players[i-1].playerName()) \n  debe moverse \(movements) espacios \n "
                        game!.moveOnBoard(numberOfMovemments: movements)
                        infoGame += "El jugador \(game!.players[i-1].playerName()) se \n  encuentra en la posicion \(game!.players[i-1].position) \n "
                        print("================TABLERO==================")
                        game!.printBoard()
                        print("================MOVIMIENTOS==================")
                       print(infoGame)
                        infoGame = ""
                    }
                }
            } else {
                let founded = game?.players.first(where: { player in
                    player.status == true
                })
                let winGame = "El jugador \(founded!.name) GANÓ!!!"
                labelStatus.text = winGame
                print(winGame)

            }
            
            
        }
        else {
            labelStatus.text = "Empieza el juego para tirar el dado"
        }
        

    }
    
}

