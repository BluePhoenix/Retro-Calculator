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
    
    var buttonSound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav") {
            let soundURL = NSURL(fileURLWithPath: path)
        
            do {
                try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
                buttonSound?.prepareToPlay()
            } catch let err as NSError {
                print("Error creating sound: \(err.debugDescription)")
            }
        } else {
            print("Error could not find path specified for sound file.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberTapped(sender: UIButton!) {
        buttonSound?.play()
    }

}

