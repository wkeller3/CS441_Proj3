//
//  GameScene.swift
//  Project3
//
//  Created by Will Keller on 9/23/19.
//  Copyright © 2019 Will Keller. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player: SKSpriteNode!
    
    override func didMove(to view: SKView){
        createPlayer()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
       
    }
    
    func createPlayer(){
        player = SKSpriteNode(color: UIColor.green, size: CGSize.init(width: 10, height: 10))
        player.zPosition = 10
        player.position = CGPoint(x: frame.width/6, y: frame.height * 0.75)
        addChild(player)
        
    }
    
}
