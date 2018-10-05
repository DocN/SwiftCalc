//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan on 2018-10-03.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var first: String = "";
    var second: String = "";
    var firstOrSecond = true;
    var dotedFirst = false;
    var dotedSecond = false;
    var sign: Character = "~"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var display: UILabel!
    
    
    @IBAction func Zero(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "0";
            displayData(data: first);
        }
        else {
            second = second + "0";
            displayData(data: second);
        }
    }
    
    @IBAction func one(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "1";
            displayData(data: first);
        }
        else {
            second = second + "1";
            displayData(data: second);
        }
    }
    
    @IBAction func two(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "2";
            displayData(data: first);
        }
        else {
            second = second + "2";
            displayData(data: second);
        }
    }
    
    @IBAction func three(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "3";
            displayData(data: first);
        }
        else {
            second = second + "3";
            displayData(data: second);
        }
    }
    
    
    @IBAction func four(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "4";
            displayData(data: first);
        }
        else {
            second = second + "4";
            displayData(data: second);
        }
    }
    
    @IBAction func five(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "5";
            displayData(data: first);
        }
        else {
            second = second + "5";
            displayData(data: second);
        }
    }
    
    @IBAction func six(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "6";
            displayData(data: first);
        }
        else {
            second = second + "6";
            displayData(data: second);
        }
    }
    @IBAction func seven(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "7";
            displayData(data: first);
        }
        else {
            second = second + "7";
            displayData(data: second);
        }
    }
    
    @IBAction func eight(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "8";
            displayData(data: first);
        }
        else {
            second = second + "8";
            displayData(data: second);
        }
    }
    
    
    @IBAction func Nine(_ sender: UIButton) {
        if(firstOrSecond) {
            first = first + "9";
            displayData(data: first);
        }
        else {
            second = second + "9";
            displayData(data: second);
        }
    }
    
    
    @IBAction func dot(_ sender: UIButton) {
        if(firstOrSecond) {
            if(dotedFirst) {
                return;
            }
            first = first + ".";
            dotedFirst = true;
            displayData(data: first);
        }
        else {
            if(dotedSecond) {
                return;
            }
            second = second + ".";
            dotedSecond = true;
            displayData(data: second);
        }
    }
    
    @IBAction func del(_ sender: UIButton) {
        if(firstOrSecond) {
            if(first.count == 0) {
                return;
            }
            first.remove(at: first.index(before: first.endIndex))
            displayData(data: first);
        }
        else {
            second.remove(at: second.index(before: second.endIndex))
            displayData(data: second);
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        firstOrSecond = true;
        first = "";
        second = "";
        dotedFirst = false;
        dotedSecond = false;
        display.text = "";
    }
    func displayData(data: String) {
        display.text = data;
    }
    
    
    @IBAction func plus(_ sender: UIButton) {
        sign = "+";
        goNextSign();
    }
    
    
    @IBAction func minus(_ sender: UIButton) {
        sign = "-";
        goNextSign();
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        sign = "*";
        goNextSign();
    }
    
    @IBAction func divide(_ sender: UIButton) {
        sign = "/";
        goNextSign();
    }
    
    func goNextSign() {
        display.text = "";
        firstOrSecond = false;
    }
    func clearSecond() {
        second = "";
        dotedSecond = false;
    }
    @IBAction func equal(_ sender: UIButton) {
        let firstVal = atof(first);
        let secondVal = atof(second);
        var equal: Double = 0;
        if(sign == "+") {
            equal = firstVal + secondVal;
        }
        else if(sign == "-") {
            equal = firstVal - secondVal;
        }
        else if(sign == "*") {
            equal = firstVal * secondVal;
        }
        else if(sign == "/") {
            equal = firstVal / secondVal;
        }
        display.text = String(equal);
        first = String(equal);
        
        let utterance = AVSpeechUtterance(string: String(equal))
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        clearSecond();
    }
}

