//
//  AppDelegate.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 25/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import SwiftySound
import GoogleMobileAds
import Firebase

var gameName  = "Math Solver & Learner Game"
var buttonFontSize:CGFloat = 17.0
var bgImage = #imageLiteral(resourceName: "bg")
var answerWas = ""

var coinPlacement:CGFloat = 25

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserDefaults.standard.setisbackGroundSoundOn(value: true)
        NotificationCenter.default.addObserver(self, selector: #selector(soundPlay), name: NSNotification.Name("sound"), object: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
            Sound.play(file: "background.mp3",numberOfLoops: 1000)
        }
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),
        withAdUnitID: "ca-app-pub-2710347124980493/2882497565")
        //UserDefaults.standard.setCoins(value:9000)
        mobileType()
        FirebaseApp.configure()

        return true
    }
    
    
    func mobileType(){
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        switch (deviceIdiom) {
        case .pad:
            coinPlacement = 50
            UserDefaults.standard.setisipad(value: true)
        case .phone:
            coinPlacement = 25
             UserDefaults.standard.setisipad(value: false)
        case .tv:
            coinPlacement = 25
           UserDefaults.standard.setisipad(value: false)
        default:
            coinPlacement = 25
            UserDefaults.standard.setisipad(value: false)
        }
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

