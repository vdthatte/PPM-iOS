//
//  ViewController.swift
//  Polytechnic Playing Machine
//
//  Created by Vidyadhar V. Thatte on 2/26/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

/*

USER1
BUTTONS:

    REPLACE - Fix error
    ADD - Done
    INSERT - Done
    SKIP
    CALCULATE AND SHOW SCORE - Done
    UPCOMING - Done

MACHINE:

*/


import UIKit
import Darwin

class Player {
    
    init(){
        
    }
    
    internal var playing = true
    internal var score = 0
    internal var add = false
    internal var replace = false
    
    // random digits
    internal var digit1 = 0
    internal var digit2 = 0
    internal var digit3 = 0
    
    // display digits
    internal var one = 0
    internal var two = 0
    internal var three = 0
    internal var four = 0
    
}


class ViewController: UIViewController {
    
    @IBOutlet weak var display4: UILabel!
    @IBOutlet weak var display3: UILabel!
    @IBOutlet weak var display2: UILabel!
    @IBOutlet weak var display1: UILabel!
    

    @IBOutlet weak var playerName: UILabel!
    
    
    let user = Player()
    let machine = Player()
    
    var random3 = 0
    var random2 = 0
    var random1 = 0
    
    var display_one = 0
    var display_two = 0
    var display_three = 0
    var display_four = 0
    
    var checkNumberButtonPressed = false
    var isScoreButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

            user.digit1 = randomProcessed()
            user.digit2 = randomProcessed()
            user.digit3 = randomProcessed()
            playerName.text = "Your turn! next digit: \(user.digit1)"
            
            machine.digit1 = randomProcessed()
            machine.digit2 = randomProcessed()
            machine.digit3 = randomProcessed()
        

    }
    
    @IBAction func insertAt4(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_four += user.digit1
                display4.text = String(display_four)
            
            }
            else if(user.replace){
            
                display_four = random1
                display4.text = String(display4)
            
            }
        }
        
        // switch user
        if(checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four) == 0){
            
        }
        
        user.score += checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four)
        
        updateDisplay()
        updateRandomDigits()

    }
    
    @IBAction func insertAt3(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_three += user.digit1
                display3.text = String(display_three)
                
            }
            else if(user.replace){
                
                display_three = user.digit1
                display3.text = String(display3)
                
            }
        }
        
        // switch user
        if(checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four) == 0){
            
        }
        
        user.score += checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four)
        
        updateDisplay()
        updateRandomDigits()

    }
    
    @IBAction func insertAt2(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_two += user.digit1
                display2.text = String(display_two)
                
            }
            else if(user.replace){
                
                display_two = user.digit1
                display2.text = String(display2)
                
            }
        }
        
        // switch user
        if(checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four) == 0){
            
        }
        
        user.score += checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four)
        
        updateDisplay()
        updateRandomDigits()

    }
    
    @IBAction func insertAt1(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_one += user.digit1
                display1.text = String(display_one)
                
            }
            else if(user.replace){
                
                display_one = user.digit1
                display1.text = String(display1)
                
            }
        }
            
        else{
            if(user.add){
                
                display_one += user.digit1
                display1.text = String(display_one)
                
            }
            else if(user.replace){
                
                display_one = user.digit1
                display1.text = String(display_one)
                
            }
        }
        
        // switch user
        if(checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four) == 0){
            
        }
        
        user.score += checkAdjacency(display_one, digit2: display_two, digit3: display_three, digit4: display_four)
        
        updateDisplay()
        updateRandomDigits()

    }
    
    @IBAction func skipTapped(sender: UIButton) {
        
    }
    
    @IBAction func addTapped(sender: UIButton) {
        if(user.playing){
            user.add = true
            user.replace = false
        }
    }
    
    @IBAction func replaceTapped(sender: UIButton) {
        if(user.playing){
            user.add = false
            user.replace = true
        }
        else{
            user.add = false
            user.replace = true
        }
    }
    
    @IBAction func checkDigitsTapped(sender: UIButton) {
        if(user.playing){
            if(checkNumberButtonPressed){
                display4.text = String(user.four)
                display3.text = String(user.three)
                display2.text = String(user.two)
                display1.text = String(user.one)
                checkNumberButtonPressed = false
            }
            else{
                display4.text = "0"
                display3.text = String(user.digit1)
                display2.text = String(user.digit2)
                display1.text = String(user.digit3)
                checkNumberButtonPressed = true
            }

        }
    }
    
    @IBAction func showScoreTapped(sender: UIButton) {
        if(user.playing){
            if(isScoreButtonPressed){
                isScoreButtonPressed = false
                display1.text = String(user.one)
                display2.text = String(user.two)
                display3.text = String(user.three)
                display4.text = String(user.four)
            }
            else{
                display4.text = String(user.score)
                display3.text = "0"
                display2.text = "0"
                display1.text = "0"
                isScoreButtonPressed = true
            }
        }
        else{
            if(isScoreButtonPressed){
                isScoreButtonPressed = false
                display1.text = String(machine.one)
                display2.text = String(machine.two)
                display3.text = String(machine.three)
                display4.text = String(machine.four)
            }
            else{
                display4.text = String(machine.score)
                display3.text = "0"
                display2.text = "0"
                display1.text = "0"
                isScoreButtonPressed = true
            }
        }
    }
    
    func checkAdjacency(digit1: Int, digit2: Int, digit3: Int, digit4: Int)->Int{ // idk if there's a better way to implement this algorithm
        
        if(digit1 == digit2){
            if(digit2 == digit3){
                if(digit3 == digit4){
                    
                    // all 4 adgacency
                    return (digit1*4)
                } // digit3 == digit4
                
                else{
                    
                    // 3 digit adjacency
                    return (digit1*3)
                }
            } // digit2 == digit3
            
            else{
                
                // 2 digit adjacency
                return (digit1*2)
            }
        } // digit1 == digit2
        
        else if(digit2 == digit3){
            
            if(digit3 == digit4){
                
                // 3 digit adjacency
                return (digit2*3)
            } // digit3 == digit4
            
            else{
                
                // 2 digit adjacency
                return (digit2*2)
            }
        } // digit2 == digit3
        
        else if(digit3 == digit4){
            
            // 2 digit adjacency
            return (digit3*2)
        } // digit3 == digit4
        
        else{
            
            // no adjacency
            return 0
        }
    
    }
    
    // makes sure 0 isn't returned
    func randomProcessed()->Int{
        var randomDigit = Int(arc4random_uniform(10))
            
        while(true){
            randomDigit = Int(arc4random_uniform(10))
            
            if(randomDigit != 0){
                break
            }
           
        }
        return randomDigit
    }

    func updateDisplay(){
        if(user.playing){
            user.one = Int(display1.text!)!
            user.two = Int(display2.text!)!
            user.three = Int(display3.text!)!
            user.four = Int(display4.text!)!
        }
        else{
            machine.one = Int(display1.text!)!
            machine.two = Int(display2.text!)!
            machine.three = Int(display3.text!)!
            machine.four = Int(display4.text!)!
        }
        
    }
    
    func updateRandomDigits(){
        if(user.playing){
            user.digit1 = user.digit2
            user.digit2 = user.digit3
            user.digit3 = randomProcessed()
            playerName.text = "Your turn! next digit: \(user.digit1)"
        }
        else{
            machine.digit1 = user.digit2
            machine.digit2 = user.digit3
            machine.digit3 = randomProcessed()
            playerName.text = "Your turn! next digit: \(user.digit1)"
        }
    }
    
    func machinePlay(){
        
        machine.one = machine.digit1
        updateDisplay()
        updateRandomDigits()
        machine.playing = false
        user.playing = true
        
    }
}

