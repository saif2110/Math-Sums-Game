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
var mathType = ""
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

