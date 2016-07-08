//
//  ViewController.swift
//  Attack-attack
//
//  Created by Mac Owner on 7/8/16.
//  Copyright © 2016 Adam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player1: Character!
    var player2: Character!

    @IBOutlet weak var attCont1: UIButton!
    @IBOutlet weak var attackCont2: UIButton!
    
    @IBOutlet weak var attLbl1: UILabel!
    @IBOutlet weak var attLbl2: UILabel!
    @IBOutlet weak var progLbl: UILabel!
    
    @IBOutlet weak var restartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartBtn.enabled = false
        
        player1 = Character(name: "Player 1", startingHp: 50, attackPower: 10)
        player2 = Character(name: "Player 2", startingHp: 50, attackPower: 10)
        
    }
    
    @IBAction func restartGame(sender: AnyObject) {
        player1.resetHp(50)
        player2.resetHp(50)
        
        restartBtn.hidden = true
        restartBtn.enabled = false
        attCont1.enabled = true
        attackCont2.enabled = true
        progLbl.text = ""
        
    }
    
    func player1AttFinished() {
        attCont1.enabled = true
    }
    
    func player2AttFinished() {
        attackCont2.enabled = true
    }
    
    func attack(attacked: Character, attackingAttPower: Int) {
        attacked.receiveAttack(attackingAttPower)
        
        if (!player1.isAlive || !player2.isAlive) {
            // Game Over
            restartBtn.enabled = true
            restartBtn.hidden = false
            attCont1.enabled = false
            attackCont2.enabled = false
            
            if (attacked.name == "Player 1") {
                progLbl.text = "Player 2 has won!"
            } else {
                progLbl.text = "Player 1 has won!"
            }
            
        } else {
            // Attack
            if (attacked.name == "Player 1") {
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(player2AttFinished), userInfo: nil, repeats: false) }
            if (attacked.name == "Player 2") {
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(player1AttFinished), userInfo: nil, repeats: false)
            }
        }
        
    }

    @IBAction func player1AttPressed(sender: AnyObject) {
        attCont1.enabled = false
        attack(player2, attackingAttPower: player1.attackPower)
        
    }

    @IBAction func player2AttPressed(sender: AnyObject) {
        attackCont2.enabled = false
        attack(player1, attackingAttPower: player2.attackPower)
    }
}

