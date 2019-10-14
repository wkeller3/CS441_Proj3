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
    var wheel: SKSpriteNode!;
    var wheel2: SKSpriteNode!;
    var floor: SKSpriteNode!;
    var flag:Bool = false;
    let cam = SKCameraNode();
    
    var connecter1: SKSpriteNode!;
    var connecter2: SKSpriteNode!;
    
    override func didMove(to view: SKView){
        //createPlayer();
        createGround();
        createCar();
        createSceneContents();
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
            player.physicsBody?.applyImpulse(CGVector.init(dx:5,dy:3));
            
//            wheel.physicsBody?.applyAngularImpulse(CGFloat(00.001));
//            wheel2.physicsBody?.applyAngularImpulse(CGFloat(0.001));
          
            
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
        wheel = SKSpriteNode(imageNamed: "wheel");
        wheel2 = SKSpriteNode(imageNamed: "wheel");
        player.position = CGPoint(x: frame.width/6, y: frame.height * 0.5);
        wheel.position = CGPoint(x: frame.width/6-15, y: frame.height * 0.5);
        wheel2.position = CGPoint(x: frame.width/6+15, y: frame.height * 0.5);
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 24));
        wheel.physicsBody = SKPhysicsBody(circleOfRadius: 7);
        wheel2.physicsBody = SKPhysicsBody(circleOfRadius: 7);
        
//        connecter1 = SKSpriteNode(color: UIColor.black, size: CGSize.init(width: 5, height: 10));
//        connecter1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 24));
//        connecter1.position = CGPoint(x: frame.width/6-15, y: frame.height * 0.3);
//        connecter2 = SKSpriteNode(color: UIColor.black, size: CGSize.init(width: 5, height: 10));
//        connecter2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 24));
//        connecter2.position = CGPoint(x: frame.width/6+15, y: frame.height * 0.3);
        
        wheel.physicsBody?.allowsRotation = true;
        wheel2.physicsBody?.allowsRotation = true;
        

        addChild(player);
        addChild(wheel);
        addChild(wheel2);

        let joint = SKPhysicsJointPin.joint(withBodyA: player.physicsBody!, bodyB: wheel.physicsBody!, anchor: wheel.position);
        let joint2 = SKPhysicsJointPin.joint(withBodyA: player.physicsBody!, bodyB: wheel2.physicsBody!, anchor: wheel2.position);

        joint.frictionTorque = 0.2;
        joint2.frictionTorque = 0.2;

        physicsWorld.add(joint);
        physicsWorld.add(joint2);
    
        
        
        
    }
    
}
