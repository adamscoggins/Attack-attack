//
//  Character.swift
//  Attack-attack
//
//  Created by Mac Owner on 7/8/16.
//  Copyright © 2016 Adam. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    private var _name: String
    
    var canAttack = true
    
    var name: String {
        get {
            return _name
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if (_hp <= 0) {
                return false
            } else {
                return true
            }
        }
    }
    
    init(name: String, startingHp: Int, attackPower: Int) {
        _hp = startingHp
        _attackPower = attackPower
        _name = name
    }
    
    func receiveAttack(attackedAmt: Int) {
        _hp -= attackedAmt
    }
    
    func resetHp(newHp: Int) {
        _hp = newHp
    }
    
    
}
