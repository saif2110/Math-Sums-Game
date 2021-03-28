
//
//  myAlert.swift
//  Created by Junaid Mukadam on 09/12/18.
//

import Foundation
import GoogleMobileAds
import UIKit


func myAlt(titel:String,message:String,coins:Int,Difficulty:String)-> UIAlertController{
    let alert = UIAlertController(title: titel, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        switch action.style{
        case .default:
            if !UserDefaults.standard.bool(forKey: Difficulty+mathType){
            if coins <= UserDefaults.standard.getCoins(){
                UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() - coins)
                UserDefaults.standard.set(true, forKey: Difficulty+mathType)
            }else{
                NotificationCenter.default.post(name:NSNotification.Name("noCoins"),object: nil)
            }
            }
        case .destructive:
            print("")
        case .cancel:
            print("")
        @unknown default:
            fatalError()
        }}))
    
    alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: { action in
          switch action.style{
          case .default:
              print("")
          case .destructive:
              print("")
          case .cancel:
            print("")
          @unknown default:
              fatalError()
          }}))
    return alert
}



//copy paste this

//self.present(myAlt(titel:"Failure",message:"Something went wrong."), animated: true, completion: nil)
