//
//  ViewController.swift
//  TempConverterApp
//
//  Created by Svayam Mishra on 08/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let converter = TempConverter()
    
    @IBOutlet weak var inputTemperature: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var currentUnitLabel: UILabel!
    @IBOutlet weak var newUnitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputTemperature.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        converter.reset()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        convertedLabel.text = converter.convertedTempDisplay
        currentUnitLabel.text = converter.tempUnits
        newUnitLabel.text = converter.newUnits
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        inputTemperature.resignFirstResponder()
        return true
    }
    
    @IBAction func convertTemp() {
        
        let userData:String = inputTemperature.text!
        if (userData == "") {
            converter.inputTemp = -500
        }
        else {
            converter.inputTemp = Int(userData) ?? -500
        }
        converter.convert()
        updateLabels()
    }
    
    @IBAction func switchChanged() {
        converter.toggleUnits()
        convertTemp()
    }

}
