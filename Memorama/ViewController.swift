//
//  ViewController.swift
//  Memorama
//
//  Created by Tony Vazgar on 9/12/18.
//  Copyright © 2018 CLTP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var scorePlayer1: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var scorePlayer2: UILabel!
    @IBAction func startButton(_ sender: UIButton) {
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

    func holaPulido(){
        //comentario para pulido xd
    }
    

}

