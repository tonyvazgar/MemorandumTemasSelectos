//
//  ViewController.swift
//  Memorama
//
//  Created by Luis Antonio Vazquez Garcia
//             Luis Alberto Flores Sanchez
//             Victor Eduardo Pulido Contreras
//             Carlos Eduardo Castelan Vazquez
//             on 9/12/18.
//  Copyright © 2018 CLTP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var scorePlayer1: UILabel!
    @IBOutlet weak var scorePlayer2: UILabel!
    
    var turn_P1 = false
    var oneImageFaceUp = false
    var prev_int_img : Int!
    var score_P1 = 0
    var score_P2 = 0
    var all_images = [String]()
    var images = [String]()
    var is_turned = [Bool]()
    
    @IBOutlet var cards : [UIImageView]!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    func checkAreTheSame(prev_image: Int, current_image: Int) -> Bool {
        let isSameCard = prev_image == current_image
        let isAPair = images[prev_image] == images[current_image]
        return !isSameCard && isAPair
    }
    
    func wait(turn_images: Bool, curr_img: Int, prev_img: Int) {
        let delay = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            if turn_images {
                self.turnImage(image: "Back", current_image: prev_img)
                self.turnImage(image: "Back", current_image: curr_img)
            } else {
                self.disableImage(prev_img)
                self.disableImage(curr_img)
            }
        })
    }
    
    func turnImage(image: String, current_image: Int) {
        cards[current_image].image = UIImage(named: image)
        is_turned[current_image] = !is_turned[current_image]
    }
    
    func disableImage(_ current_image: Int) {
        cards[current_image].isHidden = true
    }
    
    func checkFinale() -> Bool {
        return (score_P1 + score_P2) == 9
    }
    
    func updateScore(){
        if turn_P1 {
            score_P1 += 1
            scorePlayer1.text = String(score_P1)
        } else {
            score_P2 += 1
            scorePlayer2.text = String(score_P2)
        }
    }
    
    func changePlayer() {
        turn_P1 = !turn_P1
        player1Label.isHidden = !turn_P1
        player2Label.isHidden = turn_P1
    }
    
    func checkTap(_ num_card: Int) {
        if oneImageFaceUp && checkAreTheSame(prev_image: prev_int_img, current_image: num_card){
            updateScore()
            wait(turn_images: false, curr_img: num_card, prev_img: prev_int_img)
            oneImageFaceUp = false
        } else if oneImageFaceUp && !checkAreTheSame(prev_image: prev_int_img, current_image: num_card){
            changePlayer()
            wait(turn_images: true, curr_img: num_card, prev_img: prev_int_img)
            oneImageFaceUp = false
        } else {
            prev_int_img = num_card
            oneImageFaceUp = true
        }
    }
    
    func showWhoWins(who: String, score: Int) {
        let alertController = UIAlertController(title: "Player 1 Wins", message:
            "Gano con \(score) puntos", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func resetBoard() {
        for carta in cards {
            carta.isHidden = false
            carta.image = UIImage(named: "Back")
        }
        score_P1 = 0
        score_P2 = 0
        scorePlayer1.text = String(score_P1)
        scorePlayer2.text = String(score_P2)
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let nameAllImages = "1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9"
        resetButton.isHidden = false
        turn_P1 = true
        oneImageFaceUp = false
        all_images = nameAllImages.components(separatedBy: ",")
        images = [String]()
        is_turned = [Bool]()
        
        for _ in 0..<all_images.count {
            let rand = Int(arc4random_uniform(UInt32(all_images.count)))
            images.append(all_images[rand])
            is_turned.append(false)
            all_images.remove(at: rand)
        }
        
        resetBoard()
        buttonStart.isHidden = true
        player2Label.isHidden = true
        player1Label.isHidden = false
    }
    
    @IBAction func tapCarta(_ sender: UITapGestureRecognizer) {
        if let carta = sender.view {
            var num_card = 0
            var valid_tap = false
            var i = 0
            for card in cards{
                if card == carta{
                    num_card = i
                    valid_tap = true
                    break
                }else{
                    i += 1
                }
            }
            if valid_tap && !is_turned[num_card]{
                turnImage(image: images[num_card], current_image: num_card)
                checkTap(num_card)
            }
        }
        
        if checkFinale() {
            if score_P1 > score_P2 {
                showWhoWins(who: "Player 1 Wins", score: score_P1)
            } else {
                showWhoWins(who: "Player 2 Wins", score: score_P2)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
        for carta in cards{
            carta.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
