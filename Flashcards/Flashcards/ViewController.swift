//
//  ViewController.swift
//  Flashcards
//
//  Created by Svayam Mishra on 28/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var commandLabel: UILabel!
    
    let deck = Deck()
    var flashcard: Flashcard?

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        if let flashcard = deck.drawRandomCard() {
//            self.flashcard = flashcard
//            commandLabel.text = flashcard.command
//        }
//    }
    
    // because we really want a new card every time this view appears
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let flashcard = deck.drawRandomCard() {
            self.flashcard = flashcard
            commandLabel.text = flashcard.command
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDefinition" {
            let showDefinition:DefinitionViewController = segue.destinationViewController as! DefinitionViewController
            showDefinition.flashcard = self.flashcard
        }
    }
    
}

