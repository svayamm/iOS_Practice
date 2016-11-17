//
//  Player.swift
//  SDStarter
//
//  Created by Svayam Mishra on 17/11/2016.
//  Copyright © 2016 Larry Heimann. All rights reserved.
//

import UIKit
import SpriteKit

class Player: SKSpriteNode {
    
    private var canFire = true
    private var invincible = false
    // should the player live after a hit or die?
    private var lives:Int = 3 {
        didSet {
            if (lives < 0) {
                kill()
            } else {
                respawn()
            }
        }
    }
    
    init() {
        let texture = SKTexture(imageNamed: "player1")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        // preparing player for collisions once we add physics...
        
        animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // we want the player image to alternate between one with and without jet flames so it looks like it's moving
    private func animate(){
        var playerTextures:[SKTexture] = []
        for i in 1...2 {
            playerTextures.append(SKTexture(imageNamed: "player\(i)"))
        }
        let playerAnimation = SKAction.repeatActionForever(SKAction.animateWithTextures(playerTextures, timePerFrame: 0.1))
        self.runAction(playerAnimation)
    }
    
    func die (){
        // logic to be determined shortly
    }
    
    func kill(){
        // logic to be determined shortly
    }
    
    func respawn(){
        // logic to be determined shortly
    }
    
    func fireBullet(scene: SKScene){
        // to be implemented later, once we have bullets...
    }
}
