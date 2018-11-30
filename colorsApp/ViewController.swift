//
//  ViewController.swift
//  colorsApp
//
//  Created by Ana Caroline Freitas Sampaio on 20/11/2018.
//  Copyright © 2018 Ana Caroline Freitas Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var color1: UIView!
    @IBOutlet weak var color2: UIView!
    
    @IBOutlet weak var verifyBtn: UIButton!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var level: UISegmentedControl!
    
    @IBOutlet weak var reset: UIButton!
    
    var randomRed: CGFloat = 0
    var randomGreen: CGFloat = 0
    var randomBlue: CGFloat = 0
    
    func randomizeColors() {
        randomRed = CGFloat(Int.random(in: 0 ... 255))
        randomGreen = CGFloat(Int.random(in: 0 ... 255))
        randomBlue = CGFloat(Int.random(in: 0 ... 255))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizeColors()

        color1.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        
        color2.backgroundColor = UIColor(red: randomRed/255, green: randomGreen/255, blue: randomBlue/255, alpha: 1)
        
    }

    @IBAction func colorSlider(_ sender: Any) {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
    
        color1.backgroundColor = UIColor( red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func verifyBtn(_ sender: Any) {
        
        print(CGFloat(redSlider.value))
        print(randomRed)
        print(CGFloat(greenSlider.value))
        print(randomGreen)
        print(CGFloat(blueSlider.value))
        print(randomBlue)
        
        var threshold: CGFloat = 0
        
        switch level.selectedSegmentIndex {
        case 0:
            threshold = 30
        case 1:
            threshold = 20
        case 2:
            threshold = 10
        default:
            break
        }
        
        if (CGFloat(redSlider.value) >= randomRed - threshold && CGFloat(redSlider.value) <= randomRed + threshold) &&
            (CGFloat(greenSlider.value) >= randomGreen - threshold && CGFloat(greenSlider.value) <= randomGreen + threshold) &&
            (CGFloat(blueSlider.value) >= randomBlue - threshold && CGFloat(blueSlider.value) <= randomBlue + threshold) {
            labelResult.text = "Deu bom, chapa!"
            
        } else {
            labelResult.text = "No u."
        }
        
    }
    
    
    @IBAction func resetBtn(_ sender: Any) {
        randomizeColors()
        
        redSlider.value = 100
        greenSlider.value = 100
        blueSlider.value = 100
        
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        
        color1.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        
        color2.backgroundColor = UIColor(red: randomRed/255, green: randomGreen/255, blue: randomBlue/255, alpha: 1)
        
        labelResult.text = ""
        
    }
    
}

