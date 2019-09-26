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
    
    var player: SKSpriteNode!;
    var floor: SKSpriteNode!;
    
    override func didMove(to view: SKView){
        createPlayer()
        createSceneContents()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        player.physicsBody?.applyForce(CGVector.init(dx:0,dy:4000));
    }
    
    func createPlayer(){
        player = SKSpriteNode(color: UIColor.green, size: CGSize.init(width: 50, height: 50))
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        player.zPosition = 10
        player.position = CGPoint(x: frame.width/6, y: frame.height * 0.25)
        player.physicsBody?.affectedByGravity = true
        
        //add textures and animate through them
        //then repeatForever through them
    
        addChild(player)
        
    }

    func createSceneContents() {
        self.backgroundColor = .black
        self.scaleMode = .aspectFit
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
}
