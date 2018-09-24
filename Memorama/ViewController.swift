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
    var tap_count = 0
    var prev_int_img : Int!
    var curr_int_img : Int!
    var score_P1 = 0
    var score_P2 = 0
    var image_view_array: Array<UIImageView> = Array()
    var image_array: Array<UIImage> = Array()
    var all_images = [String]()
    var images = [String]()
    var is_turned = [Bool]()
    
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
        let curr_img = self.curr_int_img!
        let prev_img = self.prev_int_img!
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            if turn_images {
                self.turnImages(prev_image: prev_img, current_image: curr_img)
            } else {
                self.disableImages(prev_image: prev_img, current_image: curr_img)
            }
        })
    }
    
    func turnImages(prev_image: Int, current_image: Int) {
        image_view_array[prev_image].image = UIImage(named: "Back")
        is_turned[prev_image] = false
        image_view_array[current_image].image = UIImage(named: "Back")
        is_turned[current_image] = false
    }
    
    func disableImages(prev_image: Int, current_image: Int) {
        image_view_array[prev_image].isHidden = true
        image_view_array[current_image].isHidden = true
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
        is_turned = [Bool]()
        
        for _ in 0..<all_images.count {
            let rand = Int(arc4random_uniform(UInt32(all_images.count)))
            image_array.append(UIImage(named: all_images[rand])!)
            images.append(all_images[rand])
            all_images.remove(at: rand)
            is_turned.append(false)
        }
        
        resetCards()
        buttonStart.isHidden = true
        player2Label.isHidden = true
        player1Label.isHidden = false
    }
    
    func checkTap(num_card: Int) {
        if tap_count == 1 && checkAreTheSame(prev_image: prev_int_img, current_image: num_card){
            if !turn_P1 {
                score_P2 += 1
            } else {
                score_P1 += 1
            }
            scorePlayer1.text = String(score_P1)
            scorePlayer2.text = String(score_P2)
            curr_int_img = num_card
            wait(turn_images: false)
            tap_count = 0
        } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_int_img, current_image: num_card){
            turn_P1 = !turn_P1
            player1Label.isHidden = !turn_P1
            player2Label.isHidden = turn_P1
            curr_int_img = num_card
            wait(turn_images: true)
            tap_count = 0
        } else {
            prev_int_img = num_card
            tap_count += 1
        }
    }
    
    @IBAction func tapCarta(_ sender: UITapGestureRecognizer) {
        if let carta = sender.view {
            switch(carta) {
            case carta11 where !is_turned[0]:
                carta11.image = image_array[0]
                is_turned[0] = true
                checkTap(num_card: 0)
            case carta12 where !is_turned[1]:
                carta12.image = image_array[1]
                is_turned[1] = true
                checkTap(num_card: 1)
            case carta13 where !is_turned[2]:
                carta13.image = image_array[2]
                is_turned[2] = true
                checkTap(num_card: 2)
            case carta21 where !is_turned[3]:
                carta21.image = image_array[3]
                is_turned[3] = true
                checkTap(num_card: 3)
            case carta22 where !is_turned[4]:
                carta22.image = image_array[4]
                is_turned[4] = true
                checkTap(num_card: 4)
            case carta23 where !is_turned[5]:
                carta23.image = image_array[5]
                is_turned[5] = true
                checkTap(num_card: 5)
            case carta31 where !is_turned[6]:
                carta31.image = image_array[6]
                is_turned[6] = true
                checkTap(num_card: 6)
            case carta32 where !is_turned[7]:
                carta32.image = image_array[7]
                is_turned[7] = true
                checkTap(num_card: 7)
            case carta33 where !is_turned[8]:
                carta33.image = image_array[8]
                is_turned[8] = true
                checkTap(num_card: 8)
            case carta41 where !is_turned[9]:
                carta41.image = image_array[9]
                is_turned[9] = true
                checkTap(num_card: 9)
            case carta42 where !is_turned[10]:
                carta42.image = image_array[10]
                is_turned[10] = true
                checkTap(num_card: 10)
            case carta43 where !is_turned[11]:
                carta43.image = image_array[11]
                is_turned[11] = true
                checkTap(num_card: 11)
            case carta51 where !is_turned[12]:
                carta51.image = image_array[12]
                is_turned[12] = true
                checkTap(num_card: 12)
            case carta52 where !is_turned[13]:
                carta52.image = image_array[13]
                is_turned[13] = true
                checkTap(num_card: 13)
            case carta53 where !is_turned[14]:
                carta53.image = image_array[14]
                is_turned[14] = true
                checkTap(num_card: 14)
            case carta61 where !is_turned[15]:
                carta61.image = image_array[15]
                is_turned[15] = true
                checkTap(num_card: 15)
            case carta62 where !is_turned[16]:
                carta62.image = image_array[16]
                is_turned[16] = true
                checkTap(num_card: 16)
            case carta63 where !is_turned[17]:
                carta63.image = image_array[17]
                is_turned[17] = true
                checkTap(num_card: 17)
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

