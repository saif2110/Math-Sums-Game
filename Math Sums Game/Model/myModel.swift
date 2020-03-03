//
//  File.swift
//  Math Sums Game
//
//  Created by Abhisar Bhatnagar on 03/03/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import Foundation

enum UserDefaultsKeys : String {
    case Coins
    
    //Addition
    case MediumAddition
    case HardAddition
    
    //Subtraction
    case SubMedium
    case SubHard
    
    //Multiplication
    case MulMedium
    case MulHard
    
    
    //Dividsion
    case DivMedium
    case DivHard
}



func getCost(Diff:String) -> Int{
    if Diff == "Medium" {
        return 100
    }else{
        return 200
    }
}

extension UserDefaults {
    
    func setCoins(value: Int){
        set(value, forKey: UserDefaultsKeys.Coins.rawValue)
    }
    
    func getCoins() -> Int{
        return integer(forKey: UserDefaultsKeys.Coins.rawValue) 
    }
    
    //Addition
    func isAdditonLock(Diff:UserDefaultsKeys)-> Bool {
        return bool(forKey: Diff.rawValue)
    }
    func setAdditonLock(Diff:UserDefaultsKeys,value: Bool) {
        set(value, forKey: Diff.rawValue)
    }
    
    
}
