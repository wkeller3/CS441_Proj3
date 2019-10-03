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
//    var player: SKShapeNode!;
    var floor: SKSpriteNode!;
    var flag:Bool = false;
    let cam = SKCameraNode();
    
    override func didMove(to view: SKView){
        createPlayer();
        createSceneContents();
        createGround();
        self.camera = cam;
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        //player.physicsBody?.applyImpulse(CGVector.init(dx:0,dy:50));
        flag = true;
        //player.physicsBody?.applyImpulse(CGVector.init(dx:50,dy:0));
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        flag = false;
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(flag){
            player.physicsBody?.applyImpulse(CGVector.init(dx:5,dy:0));
        }
        cam.position = CGPoint(x: player.position.x + 200, y: player.position.y);
    }
    
    func createPlayer(){
//        player = SKShapeNode(circleOfRadius: 25);
//        player.fillColor = (UIColor.green);
//        player.physicsBody = SKPhysicsBody(circleOfRadius: 25);
        player = SKSpriteNode(color: UIColor.green, size: CGSize.init(width: 50, height: 50));
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50));
        player.zPosition = 10;
        player.position = CGPoint(x: frame.width/6, y: frame.height * 0.25);
        player.physicsBody?.affectedByGravity = true;
        
        //add textures and animate through them
        //then repeatForever through them
    
        addChild(player)
        
    }

    func createSceneContents() {
        self.backgroundColor = .white;
        self.scaleMode = .aspectFit;
        //self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame);
    }
    
    func createGround(){
//        let ground = SKSpriteNode(color: UIColor.brown, size: CGSize.init(width: 900, height: 20));
//        ground.position = CGPoint(x: 450, y: 0);
//        ground.zPosition = -10;
//        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 900, height: 20));
        let groundTexture = SKTexture(imageNamed: "ground2");
        let ground = SKSpriteNode(texture: groundTexture);
        ground.position = CGPoint(x: groundTexture.size().width/2.0, y: groundTexture.size().height/2);
        ground.physicsBody = SKPhysicsBody(texture: groundTexture, size: groundTexture.size());
        ground.physicsBody?.affectedByGravity = false;
        ground.physicsBody?.isDynamic = false;
        addChild(ground);
    }
    
}
