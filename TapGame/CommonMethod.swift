//
//  CommonMethod.swift
//  TapGame
//
//  Created by 田山由理 on 2015/12/12.
//  Copyright © 2015年 yuri. All rights reserved.
//

import Foundation
import SpriteKit
//*****************************
// 画面名を表示.
// 1:バイト画面
// 2:マンション画面
//*****************************
func makeScreenName(sceneType : Int) -> MKOutlinedLabelNode {

    let screenName : MKOutlinedLabelNode = MKOutlinedLabelNode(fontNamed: GameSetting.fontName, fontSize: 16)

    screenName.position = CGPoint(
        x : GameViewController().screenSize.width * 0.02,
        y : GameViewController().screenSize.height * 0.87
    )
    
    // 文字の色を変更する.
    screenName.fontColor = UIColor.yellowColor()
    // 文字を左揃えにする
    screenName.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    screenName.borderColor = UIColor.blackColor()
    // Labelに文字を代入.
    switch sceneType {
    case 1:
        screenName.outlinedText = "バイト"
    case 2:
        screenName.outlinedText = "マンション"
    case 3:
        screenName.outlinedText = "家賃"
    default:
        break;
    }
    
    return screenName
}

//*****************************
// 画面名下オブジェクトを表示.
//*****************************
func makeScreenNameUnderObject() -> SKShapeNode {
    let screenNameUnderObject : SKShapeNode = SKShapeNode(
        rectOfSize: CGSizeMake(
            GameViewController().screenSize.width * 0.38,
            GameViewController().screenSize.height * 0.025
        ),
        cornerRadius: 10
    )
    screenNameUnderObject.position = CGPoint(
        x : GameViewController().screenSize.width * 0.14,
        y : GameViewController().screenSize.height * 0.87
    )
    // 色を変更する.
    screenNameUnderObject.fillColor = UIColor.blueColor()
    
    return screenNameUnderObject
}