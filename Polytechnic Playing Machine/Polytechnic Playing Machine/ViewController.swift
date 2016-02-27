//
//  ViewController.swift
//  Polytechnic Playing Machine
//
//  Created by Vidyadhar V. Thatte on 2/26/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

/*
BUTTONS:

// REPLACE - Done
// ADD - Done
// INSERT - Done
// SKIP
// SCORE
// UPCOMING - Done

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
    
    internal var digit1 = 0
    internal var digit2 = 0
    internal var digit3 = 0
    
}


class ViewController: UIViewController {
    
    @IBOutlet weak var display4: UILabel!
    @IBOutlet weak var display3: UILabel!
    @IBOutlet weak var display2: UILabel!
    @IBOutlet weak var display1: UILabel!
    

    @IBOutlet weak var playerName: UILabel!
    
    
    let user = Player()
    
    var random3 = 0
    var random2 = 0
    var random1 = 0
    
    var display_one = 0
    var display_two = 0
    var display_three = 0
    var display_four = 0
    
    var checkNumberButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(user.playing == true){
            user.digit1 = Int(arc4random_uniform(10))
            user.digit2 = Int(arc4random_uniform(10))
            user.digit3 = Int(arc4random_uniform(10))
            playerName.text = "Your turn! next digit: \(user.digit1)"
            
        }

    }
    
    @IBAction func insertAt4(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_four += random1
                display4.text = String(display_four)
            
            }
            else if(user.replace){
            
                display_four = random1
                display4.text = String(display4)
            
            }
        }

    }
    
    @IBAction func insertAt3(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_three += random1
                display3.text = String(display_three)
                
            }
            else if(user.replace){
                
                display_three = random1
                display3.text = String(display3)
                
            }
        }
        
    }
    
    @IBAction func insertAt2(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_two += random1
                display2.text = String(display_two)
                
            }
            else if(user.replace){
                
                display_two = random1
                display2.text = String(display2)
                
            }
        }

    }
    
    @IBAction func insertAt1(sender: UIButton) {
        if( user.playing ){
            if(user.add){
                
                display_one += random1
                display1.text = String(display_one)
                
            }
            else if(user.replace){
                
                display_one = random1
                display1.text = String(display1)
                
            }
        }
            
        else{
            if(user.add){
                
                display_one += random1
                display1.text = String(display_one)
                
            }
            else if(user.replace){
                
                display_one = random1
                display1.text = String(display_one)
                
            }
        }
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
                display4.text = "0"
                display3.text = "0"
                display2.text = "0"
                display1.text = "0"
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


}

