//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
//  Last edit 2/13/22 by Ryan Ginnow

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceeLogo: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var rollOneButton: UIButton!
    @IBOutlet weak var rollTwoButton: UIButton!
    @IBOutlet weak var tripleLabel: UILabel!
    
    let imageCollection = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceeLogo.rotate()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            self.diceImageView1.isHidden = false;
            self.diceImageView2.isHidden = false;
            
            self.rollButton.isHidden = false;
            self.rollOneButton.isHidden = false;
            self.rollTwoButton.isHidden = false;
        })
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageView3.isHidden = true;
        tripleLabel.isHidden = true;
        
        diceImageView1.image = imageCollection.randomElement()!!
        diceImageView2.image = imageCollection.randomElement()!!
        
        if(diceImageView1.image == diceImageView2.image) {
            diceImageView3.isHidden = false;
            diceImageView3.image = imageCollection.randomElement()!!
            
            if(diceImageView3.image == diceImageView2.image) {
                tripleLabel.isHidden = false;
            }
        }
    }
    
    
    @IBAction func rollOneButtonPressed(_ sender: UIButton) {
        diceImageView3.isHidden = true;
        tripleLabel.isHidden = true;
        
        let rand = Int.random(in: 0...5);
        
        diceImageView1.image = imageCollection[rand]
        diceImageView2.image = imageCollection[rand]
    }
    
    @IBAction func rollTwoButtonPressed(_ sender: UIButton) {
        diceImageView3.isHidden = true;
        tripleLabel.isHidden = true;
        
        let rand1 = Int.random(in: 2...10)
        let rand2 = Int.random(in: 3...15)
        
        let diceVal1 = Int(round(Double(rand1 / 2)))
        let diceVal2 = Int(round(Double(rand2 / 3)))
        
        diceImageView1.image = imageCollection[diceVal1]
        diceImageView2.image = imageCollection[diceVal2]
        
        if(diceImageView1.image == diceImageView2.image) {
            diceImageView3.isHidden = false;
            diceImageView3.image = imageCollection[Int.random(in: 0...5)]
            
            if(diceImageView3.image == diceImageView2.image) {
                tripleLabel.isHidden = false;
            }
        }
    }
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = 2
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
