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
    //var player: SKShapeNode!;
    var floor: SKSpriteNode!;
    var flag:Bool = false;
    let cam = SKCameraNode();
    
    override func didMove(to view: SKView){
        //createPlayer();
        createCar();
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
        //player = SKSpriteNode(color: UIColor.green, size: CGSize.init(width: 50, height: 50));
//        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50));
//        player.zPosition = 10;
//        player.position = CGPoint(x: frame.width/6, y: frame.height * 0.25);
//        player.physicsBody?.affectedByGravity = true;
//        addChild(player)
        
    }

    func createSceneContents() {
        self.backgroundColor = .white;
        self.scaleMode = .aspectFit;
        //self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame);
    }
    
    func createGround(){
        let groundTexture = SKTexture(imageNamed: "ground2");
        let ground = SKSpriteNode(texture: groundTexture);
        ground.position = CGPoint(x: groundTexture.size().width/2.0, y: groundTexture.size().height/2);
        ground.physicsBody = SKPhysicsBody(texture: groundTexture, size: groundTexture.size());
        ground.physicsBody?.affectedByGravity = false;
        ground.physicsBody?.isDynamic = false;
        addChild(ground);
    }
    
    func createCar(){
        player = SKSpriteNode(imageNamed: "car");
        let wheel = SKSpriteNode(imageNamed: "wheel");
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 24));//24
        wheel.physicsBody = SKPhysicsBody(circleOfRadius: 7);
        player.position = CGPoint(x: frame.width/6, y: frame.height * 0.25);
        wheel.position = CGPoint(x: frame.width/6, y: frame.height * 0.25);
        addChild(player);
        addChild(wheel);
        let joint = SKPhysicsJointPin.joint(withBodyA: player.physicsBody!, bodyB: wheel.physicsBody!, anchor: CGPoint(x: CGRect(x: frame.width/6, y: frame.height * 0.25, width: 50, height: 24).maxX, y: CGRect(x: frame.width/6, y: frame.height * 0.25, width: 50, height: 24).maxY));
        physicsWorld.add(joint);
    }
    
}
