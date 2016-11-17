//
//  LevelCompleteScene.swift
//  SDStarter
//
//  Created by Svayam Mishra on 17/11/2016.
//  Copyright © 2016 Larry Heimann. All rights reserved.
//

import UIKit
import SpriteKit

class LevelCompleteScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        let startGameButton = SKSpriteNode(imageNamed: "nextlevelbtn")
        startGameButton.position = CGPointMake(size.width/2,size.height/2 - 100)
        startGameButton.name = "nextlevel"
        addChild(startGameButton)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        let touchedNode = self.nodeAtPoint(touchLocation)
        if(touchedNode.name == "nextlevel"){
            let gameOverScene = GameScene(size: size)
            gameOverScene.scaleMode = scaleMode
            let transitionType = SKTransition.flipHorizontalWithDuration(0.5)
            view?.presentScene(gameOverScene,transition: transitionType)
        }
    }

}
