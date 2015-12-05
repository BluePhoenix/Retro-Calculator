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
        buttonSound?.play()
        calculator.press(sender.tag)
        displayCalculatorData()
    }
    
    @IBAction func decimalPointTapped(sender: AnyObject) {
        buttonSound?.play()
        calculator.pressDecimal()
        displayCalculatorData()
    }
    
    @IBAction func divideTapped(sender: AnyObject) {
    }
    
    @IBAction func multiplyTapped(sender: AnyObject) {
    }
    
    @IBAction func subtractTapped(sender: AnyObject) {
    }
    
    @IBAction func addTapped(sender: AnyObject) {
        buttonSound?.play()
        calculator.add()
        displayCalculatorData()
    }
    
    @IBAction func equalTapped(sender: AnyObject) {
        buttonSound?.play()
        calculator.showResult()
        displayCalculatorData()
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        buttonSound?.play()
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
        
        clearButton.enabled = (displayLabel.text != "0")
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
}

