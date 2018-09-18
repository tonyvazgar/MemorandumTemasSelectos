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
    var prev_str_img : String!
    var score_P1 = 0
    var score_P2 = 0
    
    var all_images = ["tenis", "tenis", "negero", "negero"]
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
    
    
    func checkAreTheSame(prev_image: String, current_image: String) -> Bool {
        return prev_image == current_image
    }
    
    func turnImages(prev_image: UIImageView, current_image: UIImageView) {
        prev_image.image = UIImage(named: "Back")
        current_image.image = UIImage(named: "Back")
    }
    @objc func disableImages(prev_image: UIImageView, current_image: UIImageView) {
        prev_image.isHidden = true
        current_image.isHidden = true
    }
    
    
    
    @IBAction func startGame(_ sender: UIButton) {
        all_images = ["tenis", "tenis", "negero", "negero"]
        images = [String]()
        print("START GAME")
    }
    
    @IBAction func tapCarta(_ sender: UITapGestureRecognizer) {
        //var x = UITapGestureRecognizer.
        if let carta = sender.view {
            if carta == carta11 {
                carta11.image = UIImage(named: images[0])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_str_img, current_image: images[0]){
                    print("good 1 pair")
                    
                    disableImages(prev_image: prev_image, current_image: carta11)
                    tap_count = 0
                    score_P1 += 1
                    print(score_P1)
                    scorePlayer1.text = String(score_P1)
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[0]){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: carta11)
                    tap_count = 0
                    
                } else {
                    prev_image = carta11
                    prev_str_img = images[0]
                    tap_count += 1
                }
            } else if carta == carta12 {
                carta12.image = UIImage(named: images[1])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_str_img, current_image: images[1]){
                    print("good 1 pair")
                    disableImages(prev_image: prev_image, current_image: carta12)
                    tap_count = 0
                    score_P1 += 1
                    print(score_P1)
                    scorePlayer1.text = String(score_P1)
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[1]){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: carta12)
                    tap_count = 0
                    
                } else {
                    prev_image = carta12
                    prev_str_img = images[1]
                    tap_count += 1
                }
            } else if carta == carta13 {
                carta13.image = UIImage(named: images[2])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_str_img, current_image: images[2]){
                    print("good 1 pair")
                    disableImages(prev_image: prev_image, current_image: carta13)
                    tap_count = 0
                    score_P1 += 1
                    print(score_P1)
                    scorePlayer1.text = String(score_P1)
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[2]){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: carta13)
                    tap_count = 0
                    
                } else {
                    prev_image = carta13
                    prev_str_img = images[2]
                    tap_count += 1
                }
            } else if carta == carta21 {
                carta21.image = UIImage(named: images[3])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_str_img, current_image: images[3]){
                    print("good 1 pair")
                    disableImages(prev_image: prev_image, current_image: carta21)
                    tap_count = 0
                    score_P1 += 1
                    print(score_P1)
                    scorePlayer1.text = String(score_P1)
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[3]){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: carta21)
                    tap_count = 0
                    
                } else {
                    prev_image = carta21
                    prev_str_img = images[3]
                    tap_count += 1
                }
            }
            
            
            /*if carta == carta12 {
                carta12.image = UIImage(named: images[1])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_image, current_image: 1){
                    print("good 1 pair")
                    disableImages(prev_image: prev_image, current_image: 1)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_image, current_image: 1){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: 1)
                    tap_count = 0
                } else {
                    prev_image = 1
                    tap_count += 1
                }
                
            } else if carta == carta13 {
                carta13.image = UIImage(named: images[2])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_image, current_image: 2){
                    print("good 1 pair")
                    disableImages(prev_image: prev_image, current_image: 2)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_image, current_image: 2){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: 2)
                    tap_count = 0
                } else {
                    prev_image = 2
                    tap_count += 1
                }
                
            } else if carta == carta21 {
                carta21.image = UIImage(named: images[3])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_image, current_image: 3){
                    print("good 1 pair")
                    disableImages(prev_image: prev_image, current_image: 3)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_image, current_image: 3){
                    print("change of player")
                    turnImages(prev_image: prev_image, current_image: 3)
                    tap_count = 0
                } else {
                    prev_image = 3
                    tap_count += 1
                }
                
            }*/
            //print(carta.accessibilityIdentifier)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player1Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        scorePlayer1.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        player2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        scorePlayer2.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        for _ in 0..<all_images.count {
            let rand = Int(arc4random_uniform(UInt32(all_images.count)))
            images.append(all_images[rand])
            all_images.remove(at: rand)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startGame(){
        //Iniciar memorama
    }
    

}

