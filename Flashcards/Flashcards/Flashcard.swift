//
//  Flashcard.swift
//  Flashcards
//
//  Created by Svayam Mishra on 28/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import Foundation

struct Flashcard {

    let command: String
    let definition: String
    
    init(comString: String, defString: String) {
        command = comString
        definition = defString
    }
    
}