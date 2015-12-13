//
//  ApartmentScene.swift
//  TapGame
//
//  Created by 田山由理 on 2015/11/16.
//  Copyright © 2015年 yuri. All rights reserved.
//

import SpriteKit

class BuildingScene: SKScene{
    
    override func didMoveToView(view: SKView) {

        // 背景色を変更.
        self.backgroundColor = UIColor.whiteColor()
        // 画面名下オブジェクトを表示する.
        self.addChild(makeScreenNameUnderObject())
       // 画面名を表示する.
        self.addChild(makeScreenName(2))
        let label = SKLabelNode()
        label.text = "Appartment"
        label.position = CGPoint(x:100,y:70)
        self.addChild(label)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let _ = touches.first as UITouch? {
            let scene = JobScene(size: self.scene!.size)
            scene.scaleMode = SKSceneScaleMode.AspectFill
            self.view!.presentScene(scene)
        }

    }

}