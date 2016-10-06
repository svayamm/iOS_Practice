//
//  ViewController.swift
//  YodaSpeak
//
//  Created by Svayam Mishra on 05/10/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let translator = YodishAPI()
    
    @IBOutlet weak var inputString: UITextField!
    @IBOutlet weak var translatedLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputString.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        reset()
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
    
    @IBAction func translateStr() {
        
        let userData:String = inputString.text!
        //let trimmedString = userData.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let trimmedString = userData.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let result = translator.request(trimmedString)
        translatedLabel.text = String(result)
    }
}

