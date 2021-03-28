//
//  Ads.swift
//  List View 2
//
//  Created by Junaid Mukadam on 19/10/19.
//  Copyright © 2019 Junaid Mukadam. All rights reserved.
//

import Foundation
import GoogleMobileAds
import UIKit

//let testIntrest = "ca-app-pub-3940256099942544/4411468910"      //Test
let testIntrest = "ca-app-pub-2710347124980493/3401372318"    //Mine

//let testVideoad = "ca-app-pub-3940256099942544/5224354917"      //Test
let testVideoad = "ca-app-pub-2710347124980493/2882497565"    //Mine

private var interstitial: GADInterstitialAd?

func ShowIntrestAd(selfo:UIViewController,showAdafterSecound:Double) {
    let request = GADRequest()
    GADInterstitialAd.load(withAdUnitID:testIntrest,
                           request: request,
                           completionHandler: { [selfo] ad, error in
                            if let error = error {
                                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                return
                            }
                            interstitial = ad
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + showAdafterSecound) {
                                if interstitial != nil {
                                    interstitial?.present(fromRootViewController: selfo)
                                } else {
                                    print("Ad wasn't ready")
                                }
                            }
                           })
}
