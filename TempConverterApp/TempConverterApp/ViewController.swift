//
//  ViewController.swift
//  TempConverterApp
//
//  Created by Svayam Mishra on 08/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let converter = TempConverter()
    
    @IBOutlet weak var inputTemperature: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var currentUnitLabel: UILabel!
    @IBOutlet weak var newUnitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        convertedLabel = "--"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        
        
    }
    
    func updateDisplay() {
        
        
    }


}

