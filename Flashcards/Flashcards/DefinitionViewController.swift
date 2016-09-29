//
//  DefinitionViewController.swift
//  Flashcards
//
//  Created by Svayam Mishra on 29/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    @IBOutlet weak var commandLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var flashcard: Flashcard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let card = flashcard {
            commandLabel.text = card.command
            definitionLabel.text = card.definition
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}