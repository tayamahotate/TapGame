//
//  JobScene.swift
//  TapGame
//
//  Created by 田山由理 on 2015/11/16.
//  Copyright © 2015年 yuri. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class JobScene : SKScene {
    
    override func didMoveToView(view: SKView) {

        // 背景色を変更.
        self.backgroundColor = UIColor.whiteColor()
        // 画面名下オブジェクトを表示する.
        self.addChild(makeScreenNameUnderObject())
        // 画面名を表示する.
        self.addChild(makeScreenName(1))
        // レベルアップボタンを表示する.
        self.addChild(makeLevelUpButton())
        // レベルアップボタン(遷移用)を表示する.
        // self.addChild(makeLevelUpButtonSeni())
        // ジョブレベルを表示する.
        // self.addChild(makeJobLevelLabel())

        let label = SKLabelNode()
        label.text = "Job"
        label.position = CGPoint(x:100,y:70)
        self.addChild(label)
    }
    
    /* レベルアップボタンを表示 */
    func makeLevelUpButton() -> SKSpriteNode {
        let levelUpButton = SKSpriteNode(imageNamed: "jobLevelUpButton")
        levelUpButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.88)
        levelUpButton.size = CGSize(width: size.width * 0.3, height: size.height * 0.035)
        levelUpButton.name = "jobLevelUpButton"
        
        return levelUpButton
    }
    
    
    
    func onClickLevelUpButton(sender : UIButton) {
        
        // カスタムダイアログを生成.
        print("pop")
        let dialog = JobLevelUpDiaLog(scene: self, frame:CGRectMake(0, 0, self.view!.bounds.maxX - 50, 300))
        self.view!.addSubview(dialog)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch!
        let location: CGPoint = touch.locationInView(self.view)
        let touchPosition = (location.x, location.y)
        switch touchPosition {
            case (size.width * 0.35...size.width * 0.65, size.height * 0.1...size.height * 0.14):
                print("JobLevelUpDiaLog")
                let dialog = JobLevelUpDiaLog(scene: self, frame:CGRectMake(0, 0, self.view!.bounds.maxX - 50, 300))
                self.view!.addSubview(dialog)
            default:
                break;
        }
    }
}
