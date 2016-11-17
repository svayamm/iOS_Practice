//
//  Bullet.swift
//  SDStarter
//
//  Created by Svayam Mishra on 17/11/2016.
//  Copyright © 2016 Larry Heimann. All rights reserved.
//

import UIKit
import SpriteKit

class Bullet: SKSpriteNode {
    
    init(imageName: String, bulletSound: String?) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        if(bulletSound != nil){
            runAction(SKAction.playSoundFileNamed(bulletSound!, waitForCompletion: false))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        // SKSpriteNode conforms to NSCoding, which requires we implement this, but we can just call super.init()
        super.init(coder: aDecoder)
    }

}
