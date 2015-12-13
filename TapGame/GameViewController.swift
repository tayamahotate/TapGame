//
//  JobViewController.swift
//  TapGame
//
//  Created by 田山由理 on 2015/11/16.
//  Copyright © 2015年 yuri. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UIToolbarDelegate{
    
    private var myToolbar: UIToolbar!
    var userData : [UserData]!
    internal var screenSize : CGSize = UIScreen.mainScreen().bounds.size
    
    override func loadView() {
        // viewをSKViewに設定
        let skView = SKView(frame: UIScreen.mainScreen().bounds)
        self.view = skView
    }
    
    // 画面上部の時刻を非表示にする
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面サイズの取得
        screenSize = UIScreen.mainScreen().bounds.size
        let screenSizeStr: NSString = "Bounds width: \(screenSize.width) height: \(screenSize.height)"
        print("\(screenSizeStr)")
        
        // ツールバーを設定する.
        self.view.addSubview(setTabBar())
        
        // トップバーを作成する.
        makeTopBar(screenSize)
        
        // Job画面に遷移
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        skView.presentScene(JobScene(size: skView.bounds.size))
    }
    
    /* ツールバーの設定 */
    func setTabBar() -> UIToolbar {
        super.viewDidLoad()
        
        // ツールバーのサイズを決める.
        myToolbar = UIToolbar(frame: CGRectMake(0, screenSize.height - 44, screenSize.width, 40.0))
        
        // ツールバーの位置を決める.
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        
        // ツールバーの色を決める.
        myToolbar.barStyle = .BlackTranslucent
        myToolbar.tintColor = UIColor.whiteColor()
        myToolbar.backgroundColor = UIColor.blackColor()
        
        // ボタン１を生成する.
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Job", style:.Plain, target: self, action: "onClickBarButton:")
        myUIBarButtonGreen.tag = 1
        
        // ボタン２を生成する.
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Building", style:.Plain, target: self, action: "onClickBarButton:")
        myUIBarButtonBlue.tag = 2
        
        // ボタン3を生成する.
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.Plain, target: self, action: "onClickBarButton:")
        myUIBarButtonRed.tag = 3
        
        // ボタンをツールバーに入れる.
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        
        return myToolbar
    }

    /* トップバーの作成 */
    func makeTopBar(screenSize : CGSize) {
        // トップバーを設定する.
        self.view.addSubview(setTopBar())
        
        // トップバー.ラベル1を設定する.
        self.view.addSubview(makeTopBarLabelObject(screenSize.width * 0.02, width : screenSize.width * 0.26))
        // トップバー.ラベル2を設定する .
        self.view.addSubview(makeTopBarLabelObject(screenSize.width * 0.3, width : screenSize.width * 0.33))
        // トップバー.ラベル3を設定する.
        self.view.addSubview(makeTopBarLabelObject(screenSize.width * 0.65, width : screenSize.width * 0.33))
        // トップバー.ラベル4を設定する.
        self.view.addSubview(makeTopBarOverViewLabel(screenSize.width * 0.04, width : screenSize.width * 0.07, typeNum : 1))
        // トップバー.ラベル5を設定する.
        self.view.addSubview(makeTopBarOverViewLabel(screenSize.width * 0.32, width : screenSize.width * 0.07, typeNum : 2))
        // トップバー.ラベル6を設定する.
        self.view.addSubview(makeTopBarOverViewLabel(screenSize.width * 0.67, width : screenSize.width * 0.03, typeNum : 3))
        // トップバー.ラベル7を設定する.
        self.view.addSubview(makeRoomInfo())
        // トップバー.ラベル8を設定する.
        self.view.addSubview(makeIncomeInfo())
        // トップバー.ラベル9を設定する.
        self.view.addSubview(makeMoneyInfo())
        
        // トップバーの下線を設定する.
        self.view.addSubview(makeTopBarBottomLine())
        
    }

    /* トップバーの設定 */
    func setTopBar() -> UILabel {
        super.viewDidLoad()
        // トップバーのサイズを決める.
        let myToolbar = UILabel(frame: CGRectMake(0, 0, screenSize.width, screenSize.height * 0.06))
        // トップバーの色を決める.
        myToolbar.backgroundColor = UIColor(red: 33/255, green: 102/255, blue: 170/255, alpha: 1)
        
        return myToolbar
    }
    
    /* トップバーの汎用ラベル作成 */
    func makeTopBarLabelObject(x_position : CGFloat, width : CGFloat) -> UILabel {
        // Labelを作成.
        let topLabelObject: UILabel = UILabel(frame: CGRectMake(x_position, screenSize.height * 0.01 , width, screenSize.height * 0.04))
        // 背景を設定する.
        topLabelObject.backgroundColor = UIColor(red: 13/255, green: 40/255, blue: 70/255, alpha: 1)
        // 枠を丸くする.
        topLabelObject.layer.masksToBounds = true
        // コーナーの半径.
        topLabelObject.layer.cornerRadius = 10
        // 文字の色を白にする.
        topLabelObject.textColor = UIColor.whiteColor()
        // 文字の影の色をグレーにする.
        topLabelObject.shadowColor = UIColor.grayColor()
        // Textを中央寄せにする.
        topLabelObject.textAlignment = NSTextAlignment.Center
        
        return topLabelObject
    }
    
    /* トップバーの概要ラベル作成 */
    func makeTopBarOverViewLabel(x_position : CGFloat, width : CGFloat, typeNum : Int) -> UILabel {

        // Labelを作成.
        let overViewLabel: UILabel = UILabel(frame: CGRectMake(x_position, screenSize.height * 0.02, width, screenSize.height * 0.03))
        
        // Labelに文字を代入.
        switch typeNum {
            case 1:
                overViewLabel.text = "部屋"
            case 2:
                overViewLabel.text = "家賃"
            case 3:
                overViewLabel.text = "$"
            default:
                break;
        }
        
        // 文字の色を変更する.
        overViewLabel.textColor = UIColor.yellowColor()
        // フォントとサイズ設定.
        overViewLabel.font = UIFont(name: GameSetting.fontName, size: 11)
        
        return overViewLabel
    }
    
    /* トップバーの部屋情報表示 */
    func makeRoomInfo() -> UILabel {
        let roomInfo : UILabel = UILabel(frame: CGRectMake(screenSize.width * 0.12, screenSize.height * 0.015, screenSize.width * 0.15, screenSize.height * 0.035))
        // 文字の色を変更する.
        roomInfo.textColor = UIColor.whiteColor()
        // フォントとサイズ設定.
        roomInfo.font = UIFont(name: GameSetting.fontName, size: 13)
        // Labelに文字を代入.
        roomInfo.text = "未設定"

        return roomInfo
    }
    
    /* トップバーの部屋情報表示 */
    func makeIncomeInfo() -> UILabel {
        let incomeInfo : UILabel = UILabel(frame: CGRectMake(screenSize.width * 0.4, screenSize.height * 0.015, screenSize.width * 0.23, screenSize.height * 0.035))
        // 文字の色を変更する.
        incomeInfo.textColor = UIColor.whiteColor()
        // フォントとサイズ設定.
        incomeInfo.font = UIFont(name: GameSetting.fontName, size: 13)
        // Labelに文字を代入.
        incomeInfo.text = "9999" + "$/秒"
        
        return incomeInfo
    }
    
    /* トップバーの部屋情報表示 */
    func makeMoneyInfo() -> UILabel {
        let moneyInfo : UILabel = UILabel(frame: CGRectMake(screenSize.width * 0.71, screenSize.height * 0.015, screenSize.width * 0.26, screenSize.height * 0.035))
        // 文字の色を変更する.
        moneyInfo.textColor = UIColor.whiteColor()
        // フォントとサイズ設定.
        moneyInfo.font = UIFont(name: GameSetting.fontName, size: 13)
        // Labelに文字を代入.
        moneyInfo.text = "999999" + "$"
        
        return moneyInfo
    }
    
    /* トップバーの下線作成 */
    func makeTopBarBottomLine() -> UILabel {
        let topBarBottomLine : UILabel = UILabel(frame: CGRectMake(0, screenSize.height * 0.06, screenSize.width, screenSize.height * 0.005))
        topBarBottomLine.backgroundColor = UIColor.blackColor()
        
        return topBarBottomLine
    }
    
    //*****************************
    // ツールバー押下処理
    //*****************************

    internal func onClickBarButton(sender: UIBarButtonItem) {
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        
        switch sender.tag {
        case 1:
            print("tapJobScene")
            skView.presentScene(JobScene(size: skView.bounds.size))
        case 2:
            print("BuildingScene")
            skView.presentScene(BuildingScene(size: skView.bounds.size))
        case 3:
            print("OtherScene")
            skView.backgroundColor = UIColor.redColor()
        default:
            print("ERROR!!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

