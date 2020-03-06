//
//  AppDelegate.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 25/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import SwiftySound

var gameName  = "Math Sums Learner for Kids"
var buttonFontSize:CGFloat = 17.0
var bgImage = #imageLiteral(resourceName: "bg")
var answerWas = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserDefaults.standard.setisbackGroundSoundOn(value: true)
        NotificationCenter.default.addObserver(self, selector: #selector(soundPlay), name: NSNotification.Name("sound"), object: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
            Sound.play(file: "background.mp3",numberOfLoops: 1000)
        }
        return true
    }
    
    
    
    @objc func soundPlay(){
        if UserDefaults.standard.isbackGroundSoundOn(){
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                Sound.play(file: "background.mp3",numberOfLoops: 1000)
            }
        }else{
            Sound.stopAll()
        }
    }
    
    
   
}

