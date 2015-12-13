//
//  TitleScene.swift
//  TapGame
//
//  Created by 田山由理 on 2015/11/16.
//  Copyright © 2015年 yuri. All rights reserved.
//

import UIKit
import SpriteKit

class TitleScene: SKScene {
    override func didMoveToView(view: SKView) {
        // 背景の作成
        let background = SKSpriteNode(imageNamed: "title")
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        background.size = CGSize(width: size.width, height: size.height)
        addChild(background)
        
    }
}