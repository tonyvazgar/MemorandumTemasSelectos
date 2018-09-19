//
//  ViewController.swift
//  Memorama
//
//  Created by Tony Vazgar
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
    var tap_count = 0
    var prev_image : UIImageView!
    var current_image : UIImageView!
    var prev_int_img : Int!
    var score_P1 = 0
    var score_P2 = 0
    var image_view_array: Array<UIImageView> = Array()
    var image_array: Array<UIImage> = Array()
    var all_images = [String]()
    var images = [String]()
    
    @IBOutlet weak var carta11: UIImageView!
    @IBOutlet weak var carta12: UIImageView!
    @IBOutlet weak var carta13: UIImageView!
    @IBOutlet weak var carta21: UIImageView!
    @IBOutlet weak var carta22: UIImageView!
    @IBOutlet weak var carta23: UIImageView!
    @IBOutlet weak var carta31: UIImageView!
    @IBOutlet weak var carta32: UIImageView!
    @IBOutlet weak var carta33: UIImageView!
    @IBOutlet weak var carta41: UIImageView!
    @IBOutlet weak var carta42: UIImageView!
    @IBOutlet weak var carta43: UIImageView!
    @IBOutlet weak var carta51: UIImageView!
    @IBOutlet weak var carta52: UIImageView!
    @IBOutlet weak var carta53: UIImageView!
    @IBOutlet weak var carta61: UIImageView!
    @IBOutlet weak var carta62: UIImageView!
    @IBOutlet weak var carta63: UIImageView!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    func checkAreTheSame(prev_image: Int, current_image: Int) -> Bool {
        let isSameCard = prev_image == current_image
        let isAPair = images[prev_image] == images[current_image]
        return !isSameCard && isAPair
    }
    
    
    func wait(turn_images: Bool) {
        let delay = 1
        let curr_img = self.current_image!
        let prev_img = self.prev_image!
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            if turn_images {
                self.turnImages(prev_image: prev_img, current_image: curr_img)
            } else {
                self.disableImages(prev_image: prev_img, current_image: curr_img)
            }
        })
    }
    
    func turnImages(prev_image: UIImageView, current_image: UIImageView) {
        prev_image.image = UIImage(named: "Back")
        current_image.image = UIImage(named: "Back")
        
    }
    func disableImages(prev_image: UIImageView, current_image: UIImageView) {
        prev_image.isHidden = true
        current_image.isHidden = true
    }
    
    func checkFinale() -> Bool {
        return (score_P1 + score_P2) == 9
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        resetButton.isHidden = false
        turn_P1 = true
        tap_count = 0
        all_images = "1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9".components(separatedBy: ",")
        images = [String]()
        image_array = [UIImage]()
        
        for _ in 0..<all_images.count {
            let rand = Int(arc4random_uniform(UInt32(all_images.count)))
            image_array.append(UIImage(named: all_images[rand])!)
            images.append(all_images[rand])
            all_images.remove(at: rand)
        }
        
        resetCards()
        buttonStart.isHidden = true
        player2Label.isHidden = true
        player1Label.isHidden = false
    }
    
    func checkTap(card: UIImageView, num_card: Int) {
        if tap_count == 1 && checkAreTheSame(prev_image: prev_int_img, current_image: num_card){
            if !turn_P1 {
                score_P2 += 1
            } else {
                score_P1 += 1
            }
            scorePlayer1.text = String(score_P1)
            scorePlayer2.text = String(score_P2)
            current_image = card
            wait(turn_images: false)
            tap_count = 0
        } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_int_img, current_image: num_card){
            turn_P1 = !turn_P1
            player1Label.isHidden = !turn_P1
            player2Label.isHidden = turn_P1
            current_image = card
            wait(turn_images: true)
            tap_count = 0
        } else {
            prev_image = card
            prev_int_img = num_card
            tap_count += 1
        }
    }
    
    @IBAction func tapCarta(_ sender: UITapGestureRecognizer) {
        //var x = UITapGestureRecognizer.
        if let carta = sender.view {
            switch(carta) {
            case carta11:
                carta11.image = image_array[0]
                checkTap(card: carta11, num_card: 0)
            case carta12:
                carta12.image = image_array[1]
                checkTap(card: carta12, num_card: 1)
            case carta13:
                carta13.image = image_array[2]
                checkTap(card: carta13, num_card: 2)
            case carta21:
                carta21.image = image_array[3]
                checkTap(card: carta21, num_card: 3)
            case carta22:
                carta22.image = image_array[4]
                checkTap(card: carta22, num_card: 4)
            case carta23:
                carta23.image = image_array[5]
                checkTap(card: carta23, num_card: 5)
            case carta31:
                carta31.image = image_array[6]
                checkTap(card: carta31, num_card: 6)
            case carta32:
                carta32.image = image_array[7]
                checkTap(card: carta32, num_card: 7)
            case carta33:
                carta33.image = image_array[8]
                checkTap(card: carta33, num_card: 8)
            case carta41:
                carta41.image = image_array[9]
                checkTap(card: carta41, num_card: 9)
            case carta42:
                carta42.image = image_array[10]
                checkTap(card: carta42, num_card: 10)
            case carta43:
                carta43.image = image_array[11]
                checkTap(card: carta43, num_card: 11)
            case carta51:
                carta51.image = image_array[12]
                checkTap(card: carta51, num_card: 12)
            case carta52:
                carta52.image = image_array[13]
                checkTap(card: carta52, num_card: 13)
            case carta53:
                carta53.image = image_array[14]
                checkTap(card: carta53, num_card: 14)
            case carta61:
                carta61.image = image_array[15]
                checkTap(card: carta61, num_card: 15)
            case carta62:
                carta62.image = image_array[16]
                checkTap(card: carta62, num_card: 16)
            case carta63:
                carta63.image = image_array[17]
                checkTap(card: carta63, num_card: 17)
            default:
                break
            }
            
        }
        if checkFinale(){
            if score_P1 > score_P2 {
                let alertController = UIAlertController(title: "Player 1 Wins", message:
                    "Gano con \(score_P1) puntos", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Player 2 Wins", message:
                    "Gano con \(score_P2) puntos", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
 
    func resetCards() {
        for carta in image_view_array{
            carta.isHidden = false
            carta.image = UIImage(named: "Back")
        }
        score_P1 = 0
        score_P2 = 0
        scorePlayer1.text = String(score_P1)
        scorePlayer2.text = String(score_P2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
        turn_P1 = true
        
        image_view_array = [carta11, carta12, carta13, carta21, carta22, carta23, carta31, carta32, carta33, carta41, carta42, carta43, carta51, carta52, carta53, carta61, carta62, carta63]
        for carta in image_view_array{
            carta.isHidden = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

