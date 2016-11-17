//
//  Invader.swift
//  SDStarter
//
//  Created by Svayam Mishra on 17/11/2016.
//  Copyright © 2016 Larry Heimann. All rights reserved.
//

import UIKit
import SpriteKit

class Invader: SKSpriteNode {
    // we will determine the invader's row/column later, set to (0,0) for now
    var invaderRow = 0
    var invaderColumn = 0
    
    init() {
        // we have three types of invader images so randomly chose among these
        let randNum = Int(arc4random_uniform(3) + 1)
        let texture = SKTexture(imageNamed: "invader\(randNum)")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        self.name = "invader"
        
        // preparing invaders for collisions once we add physics...
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        // SKSpriteNode conforms to NSCoding, which requires we implement this, but we can just call super.init()
        super.init(coder: aDecoder)
    }
    
    func fireBullet(scene: SKScene){
        // to be implemented later, once we have bullets...
        
    }
}
