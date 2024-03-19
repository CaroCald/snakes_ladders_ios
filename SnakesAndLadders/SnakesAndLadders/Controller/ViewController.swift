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
            game = try Game(numberOfPlayers: numberOfPlayers, diceProtocol: Dice(), board: Board.create(rows: 10, columns: 10, snakes: TestValues.arraySnakes, ladders: TestValues.arrayladders))
            game!.startGame()
            labelStatus.text = "Juego iniciado"
            labelMovements.text = ""
            
        } catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func playGamePressed(_ sender: UIButton) {
        if let gameExist = game {
            do {
                try gameExist.playGame()
                if !gameExist.gameIsNotOver() {
                    showWinningPlayerInfo(gameExist)
                }
            } catch CustomErrors.customError(let errorMessage){
                print(errorMessage)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    @IBAction func rollDicePressed(_ sender: UIButton) {
        do {
            if let gameExist = game {
                if !gameExist.statusGame() {
                    let turns = "Fue el turno del \(gameExist.getNextPlayer().name)"
                    print(turns)
                    labelMovements.text = turns
                    game!.moveOnePlayerOnBoard(spaces: try gameExist.diceProtocol.rollDice(), player: gameExist.getNextPlayer())
                } else {
                    showWinningPlayerInfo(gameExist)
                }
            }
            else {
                labelStatus.text = "Empieza el juego para lanzar el dado"
            }
        } catch CustomErrors.customError(let errorMessage){
            print(errorMessage)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func showWinningPlayerInfo(_ gameExist: Game) {
        let playerWinner = gameExist.getWinner()
        let winGame = "El \(playerWinner.name) GANÓ!!! "
        labelStatus.text = winGame
        let moves = "necesito de \(playerWinner.requiredMovements) movimientos"
        labelMovements.text = moves
        print(winGame + moves)
    }
    
}

