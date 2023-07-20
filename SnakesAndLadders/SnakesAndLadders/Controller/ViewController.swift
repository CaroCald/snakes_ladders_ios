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
        
        do {
            numberOfPlayers = Int(playerInput.text ?? "2") ?? 2
            game = try Game(players: [], dice: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            game!.addPlayers(numberOfPlayers: numberOfPlayers)
            game!.startGame()
            labelStatus.text = "Juego iniciado"
            labelMovements.text = ""
            
        }catch CustomErrors.customError(let errorMessage){
           print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
       
    }
    
    @IBAction func rollDicePressed(_ sender: UIButton) {

        if game != nil {
            if !game!.statusGame() {
                for player in game!.players {
                    game!.moveOnBoard(spaces: game!.dice.rollDice(), player: player)
                }

            } else {
                let founded = game!.players.first(where: { player in
                    player.status == true
                })
                let winGame = "El \(founded!.name) GANÓ!!!"
                labelStatus.text = winGame
                let moves = "necesito de \(founded!.requiredMovements) movimientos"
                labelMovements.text = moves
                print(winGame + moves)
            }
            
        }
        else {
            labelStatus.text = "Empieza el juego para tirar el dado"
        }
    }
}

