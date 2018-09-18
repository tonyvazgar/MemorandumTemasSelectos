//
//  ViewController.swift
//  Memorama
//
//  Created by Tony Vazgar on 9/12/18.
//  Copyright © 2018 CLTP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var scorePlayer1: UILabel!
    @IBOutlet weak var scorePlayer2: UILabel!
    
    var turn_P1 = false
    var finale = false
    var tap_count = 0
    var prev_image : UIImageView!
    var current_image : UIImageView!
    var prev_str_img : String!
    var score_P1 = 0
    var score_P2 = 0
    
    var all_images = ["1", "2", "2", "1", "3", "3"]
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
    
    func wait(turn_images: Bool) {
        /*let delay = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            if turn_images {
                self.turnImages()
            } else {
                self.disableImages()
            }
        })*/
        if turn_images {
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(turnImages), userInfo: nil, repeats: false)
        } else {
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(disableImages), userInfo: nil, repeats: false)
        }
    }
    
    @objc func turnImages() {
        self.prev_image.image = UIImage(named: "Back")
        self.current_image.image = UIImage(named: "Back")
        
    }
    @objc func disableImages() {
        self.prev_image.isHidden = true
        self.current_image.isHidden = true
    }
    
    func checkFinale() -> Bool {
        return carta11.isHidden && carta12.isHidden && carta13.isHidden
        && carta21.isHidden && carta22.isHidden && carta23.isHidden
        && carta31.isHidden && carta32.isHidden && carta33.isHidden
        && carta41.isHidden && carta42.isHidden && carta43.isHidden
        && carta51.isHidden && carta52.isHidden && carta53.isHidden
        && carta61.isHidden && carta62.isHidden && carta63.isHidden
    }
    
    
    
    @IBAction func startGame(_ sender: UIButton) {
        all_images = ["1", "2", "2", "1", "3", "3"]
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
                    current_image = carta11
                    wait(turn_images: false)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[0]){
                    print("change of player")
                    current_image = carta11
                    wait(turn_images: true)
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
                    current_image = carta12
                    wait(turn_images: false)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[1]){
                    print("change of player")
                    current_image = carta12
                    wait(turn_images: true)
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
                    current_image = carta13
                    wait(turn_images: false)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[2]){
                    print("change of player")
                    current_image = carta13
                    wait(turn_images: true)
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
                    current_image = carta21
                    wait(turn_images: false)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[3]){
                    print("change of player")
                    current_image = carta21
                    wait(turn_images: true)
                    tap_count = 0
                    
                } else {
                    prev_image = carta21
                    prev_str_img = images[3]
                    tap_count += 1
                } 
            } else if carta == carta22 {
                carta22.image = UIImage(named: images[4])
                if tap_count == 1 && checkAreTheSame(prev_image: prev_str_img, current_image: images[4]){
                    print("good 1 pair")
                    current_image = carta22
                    wait(turn_images: false)
                    tap_count = 0
                } else if tap_count == 1 && !checkAreTheSame(prev_image: prev_str_img, current_image: images[4]){
                    print("change of player")
                    current_image = carta22
                    wait(turn_images: true)
                    tap_count = 0
                } else {
                    prev_image = carta22
                    prev_str_img = images[4]
                    tap_count += 1
                }
            }
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

}

