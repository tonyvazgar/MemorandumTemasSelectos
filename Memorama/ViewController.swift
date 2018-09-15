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
    
    @IBOutlet weak var carta11: UIImageView!
    @IBOutlet weak var carta12: UIImageView!
    @IBOutlet weak var carta13: UIImageView!
    
    
    @IBAction func startButton(_ sender: UIButton) {
        //startGame()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("START GAME")
    }
    @IBAction func tapCarta(_ sender: UITapGestureRecognizer) {
        //var x = UITapGestureRecognizer.
        if let carta = sender.view {
            print(carta.accessibilityIdentifier)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player1Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        scorePlayer1.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        player2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        scorePlayer2.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startGame(){
        //Iniciar memorama
    }
    

}

