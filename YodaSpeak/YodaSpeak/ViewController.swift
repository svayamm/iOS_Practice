//
//  ViewController.swift
//  YodaSpeak
//
//  Created by Svayam Mishra on 05/10/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {

    let translator = YodishAPI()
    
    @IBOutlet weak var inputString: UITextField!
    @IBOutlet weak var translatedLabel: UILabel!
    @IBOutlet weak var speakButton: UIButton!
    
    let speechSynthesizer = AVSpeechSynthesizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputString.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        reset()
        speakButton.enabled = false
        inputString.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reset() {
        translatedLabel.text = "Yoda translation here goes. Yes."
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        translateStr()
        inputString.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        inputString.text = ""
        translatedLabel.text = ""
        speakButton.enabled = false
    }
    
    @IBAction func translateStr() {
        let userData:String = inputString.text!
        //let trimmedString = userData.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let trimmedString = userData.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let result = translator.request(trimmedString)
        translatedLabel.text = String(result)
        speakButton.enabled = true
    }
    
    @IBAction func speak() {
        let speechUtterance = AVSpeechUtterance(string: translatedLabel.text!)
        speechSynthesizer.speakUtterance(speechUtterance)
    }
}


