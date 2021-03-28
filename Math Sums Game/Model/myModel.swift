//
//  File.swift
//  Math Sums Game
//
//  Created by Abhisar Bhatnagar on 03/03/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import Foundation
import StoreKit
import AppTrackingTransparency

enum UserDefaultsKeys : String {
    case Coins
    case isbackgroundSoundon
    case numberOFtimeAppOpen
    case isRated
    case isipad
}

func getCost(Diff:String) -> Int{
    if Diff == "Medium" {
        return 150
    }else{
        return 1050
    }
}


extension UserDefaults {
    func setCoins(value: Int){
        set(value, forKey: UserDefaultsKeys.Coins.rawValue)
    }
    func getCoins() -> Int{
        return integer(forKey: UserDefaultsKeys.Coins.rawValue) 
    }
    func isbackGroundSoundOn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isbackgroundSoundon.rawValue)
    }
    func setisbackGroundSoundOn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isbackgroundSoundon.rawValue)
    }
    func setnumberOFtimeAppOpen(value: Int){
        set(value, forKey: UserDefaultsKeys.numberOFtimeAppOpen.rawValue)
    }
    func getnumberOFtimeAppOpen() -> Int{
        return integer(forKey: UserDefaultsKeys.numberOFtimeAppOpen.rawValue)
    }
    
    func isisipad()-> Bool {
        return bool(forKey: UserDefaultsKeys.isipad.rawValue)
    }
    func setisipad(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isipad.rawValue)
    }
    
    func isRated()-> Bool {
        return bool(forKey: UserDefaultsKeys.isRated.rawValue)
    }
    func setisRated(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isRated.rawValue)
    }
}

func rateApp() {
    
    SKStoreReviewController.requestReview()
    
}

var firstTimeopen = true
func CountNumberofTimesAppOpen() -> Int{
    let totatNumberofTimeappOpen = UserDefaults.standard.getnumberOFtimeAppOpen()
    if firstTimeopen{
        UserDefaults.standard.setnumberOFtimeAppOpen(value: totatNumberofTimeappOpen + 1)
        firstTimeopen.toggle()
        //print(totatNumberofTimeappOpen)
        return totatNumberofTimeappOpen
    }else{
        return totatNumberofTimeappOpen
    }
    
}


func requestPermission() {
    if #available(iOS 14, *) {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { (status) in
            switch status {
            case .authorized:
                print("authorized")
                break
            case .denied:
                print("Denied")
                break
            case .notDetermined:
                print("Not Determined")
            case .restricted:
                print("Restricted")
            @unknown default:
                print("Unknown")
            }
        })
    }
}

