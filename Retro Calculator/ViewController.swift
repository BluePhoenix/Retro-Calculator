//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Felix Barros on 12/4/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    var buttonSound: AVAudioPlayer?
    let calculator = CalculatorEngine()
    
    var runningNumber: String = ""
    var leftValueString = ""
    var rightValueString = ""
    var selectedOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadAudioPlayer()
        displayCalculatorData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberTapped(sender: UIButton!) {
        playSound()
        calculator.press(sender.tag)
        displayCalculatorData()
    }
    
    @IBAction func decimalPointTapped(sender: AnyObject) {
        playSound()
        calculator.pressDecimal()
        displayCalculatorData()
    }
    
    @IBAction func divideTapped(sender: AnyObject) {
        playSound()
        calculator.divide()
        displayCalculatorData()
    }
    
    @IBAction func multiplyTapped(sender: AnyObject) {
        playSound()
        calculator.multiply()
        displayCalculatorData()
    }
    
    @IBAction func subtractTapped(sender: AnyObject) {
        playSound()
        calculator.subtract()
        displayCalculatorData()
    }
    
    @IBAction func addTapped(sender: AnyObject) {
        playSound()
        calculator.add()
        displayCalculatorData()
    }
    
    @IBAction func equalTapped(sender: AnyObject) {
        playSound()
        calculator.showResult()
        displayCalculatorData()
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        playSound()
        calculator.clear()
        displayCalculatorData()
    }
    
    // MARK: Helper functions
    func displayCalculatorData() {
        // TODO: Move number formatting into the calculator engine
        // This will allow better tracking of trailing 0 after decimal point
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        numberFormatter.maximumSignificantDigits = 36
        displayLabel.text = numberFormatter.stringFromNumber(calculator.enteredNumber)
    }
    
    func loadAudioPlayer() {
        if let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav") {
            let soundURL = NSURL(fileURLWithPath: path)
            
            do {
                try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
                buttonSound?.volume = 0.1
                buttonSound?.prepareToPlay()
            } catch let err as NSError {
                print("Error creating sound: \(err.debugDescription)")
            }
        } else {
            print("Error could not find path specified for sound file.")
        }
    }
    
    func playSound() {
        guard let sound = buttonSound else {
            return
        }
        
        if sound.playing {
            sound.stop()
        }
        
        sound.play()
    }
    
    // Status bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

