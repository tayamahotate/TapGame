//
//  ViewController.swift
//  TapGame
//
//  Created by 田山由理 on 2015/11/15.
//  Copyright © 2015年 yuri. All rights reserved.
//

import UIKit
import SpriteKit
import RealmSwift

class ViewController: UIViewController {

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
        
        let realm = try! Realm()
        
        // 初期設定が終わっていない場合は、初期設定としてUserDataテーブルを設定する。
         if realm.objects(UserData).count == 0 {

            let userData = UserData()
            userData.username = "HOTATE"
            userData.startdate = NSDate()
            userData.logindate = NSDate()
            
            realm.beginWrite()
            realm.add(userData)
            try! realm.commitWrite()
        }
        
        
        // タイトルの表示
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        let scene = TitleScene(size: skView.bounds.size)
        skView.presentScene(scene)

    }
    
    /******************************
    // 画面遷移系の処理はviewWillAppearに書くっぽい
    ******************************/
    override func viewWillAppear(animated: Bool) {
        // タイマーの設定
        NSTimer.scheduledTimerWithTimeInterval(
            0.2                                                 // 遷移時間
            ,target:self                                        // 呼出先のインスタンス
            ,selector:Selector("tranToJob")                     // 呼出先のメソッド
            ,userInfo: nil                                      // メソッドに受け渡す情報
            ,repeats: false                                     // タイマーの実行を繰り返すかどうか
        )
    }
    
    /******************************
    // ジョブ画面への遷移
    ******************************/
    func tranToJob() {
        let gameViewController = GameViewController()
        print("tranToJob")
        self.presentViewController(gameViewController, animated: true, completion: nil)
    }

}

