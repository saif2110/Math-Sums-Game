//
//  SelectLevel.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 25/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import SwiftySound
import GoogleMobileAds
import StoreKit

class SelectLevel: UIViewController,GADRewardBasedVideoAdDelegate{
   func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
         UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() + 70)
         cointext.text = String(UserDefaults.standard.getCoins())
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        view.addSubview(gameTitel)
        contriant()
        
        let tap = UITapGestureRecognizer()
        tap.name = "Easy"
        tap.addTarget(self, action: #selector(easyPressed(sender:)))
        Easy.addGestureRecognizer(tap)
        
        let tap2 = UITapGestureRecognizer()
        tap2.name = "Medium"
        tap2.addTarget(self, action: #selector(easyPressed(sender:)))
        Medium.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer()
        tap3.name = "Hard"
        tap3.addTarget(self, action: #selector(easyPressed(sender:)))
        Hard.addGestureRecognizer(tap3)
        
        cointext.text = String(UserDefaults.standard.getCoins())
        back.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(noCoins), name: NSNotification.Name("noCoins"), object: nil)
        coinAdd.addTarget(self, action: #selector(showAdpopUP), for: .touchUpInside)
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        }
        
        func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
             UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() + 70)
        }
    
    @objc func showAdpopUP(){
       self.present(showVideoAds(slf: self), animated: true, completion: nil)
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: testVideoad)
    }
        
        @objc func backPressed(){
            self.dismiss(animated: true, completion: nil)
        }
        
        @objc func easyPressed(sender: UIGestureRecognizer) {
            
            Sound.play(file: "pop.mp3")
            
            if sender.name! == "Easy"{
                let vc = GameEngViewController()
                difficulty = sender.name!
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }else{
                if UserDefaults.standard.bool(forKey: sender.name!+mathType) == false{
                    self.present(myAlt(titel:"You Want to Unlock The \(sender.name!) Difficulty ?",message:"It will cost you \(getCost(Diff: sender.name!)) Coins",coins:getCost(Diff: sender.name!), Difficulty: sender.name!), animated: true, completion: nil)
                }else{
                    let vc = GameEngViewController()
                    difficulty = sender.name!
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
        
        lazy var background:UIImageView = {
            let background = UIImageView()
            background.image = bgImage
            return background
        }()
        
        
        lazy var back:UIButton = {
            let background = UIButton()
            background.setImage(#imageLiteral(resourceName: "back"), for: .normal)
            return background
        }()
        
        lazy var gameTitel:UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.text = "Select Level"
            label.font = UIFont.init(name: "DKCrayonCrumble", size: 45) //Chalkduster DKCrayonCrumble
            return label
        }()
        
        lazy var Easy:EasyMidHardView = {
            let button = EasyMidHardView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
            button.updateDifficulty(title: "Easy")
            button.updateCoinslabel(title: "🔓 UNLOCKED")
            return button
        }()
        
        lazy var Medium:EasyMidHardView = {
            let button = EasyMidHardView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
            button.updateDifficulty(title: "Medium")
            if UserDefaults.standard.bool(forKey: "Medium"+mathType) == true{
                button.updateCoinslabel(title: "🔓 UNLOCKED")
            }else{
                button.updateCoinslabel(title: "🔐 LOCKED",colour: .red)
            }
            
            return button
        }()
        
        lazy var Hard:EasyMidHardView = {
            let button = EasyMidHardView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
            button.updateDifficulty(title: "Hard")
            
            if UserDefaults.standard.bool(forKey: "Hard"+mathType) == true{
                button.updateCoinslabel(title: "🔓 UNLOCKED")
            }else{
                button.updateCoinslabel(title: "🔐 LOCKED",colour: .red)
            }
            
            return button
        }()
        
        lazy var coinImage:UIImageView = {
            let button = UIImageView()
            button.image = #imageLiteral(resourceName: "coins")
            return button
        }()
        
        lazy var cointext:UILabel = {
            let button = UILabel()
            button.textColor = .orange
            button.text = "00"
            return button
        }()
        
        lazy var coinAdd:UIButton = {
            let button = UIButton()
            button.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
            return button
        }()
        
        func contriant(){
            view.addSubview(back)
            back.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                back.topAnchor.constraint(equalTo: self.view.topAnchor,constant: coinPlacement+10),
                back.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 35),
                back.heightAnchor.constraint(equalToConstant: 35),
                back.widthAnchor.constraint(equalToConstant: 35)
            ])
            
            gameTitel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                gameTitel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 35),
                gameTitel.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -20),
                gameTitel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
                gameTitel.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.15)
            ])
            
            view.addSubview(coinImage)
            view.addSubview(cointext)
            view.addSubview(coinAdd)
            
            cointext.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cointext.topAnchor.constraint(equalTo: self.view.topAnchor,constant: coinPlacement),
                cointext.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -10),
                cointext.heightAnchor.constraint(equalToConstant: 35),
                cointext.widthAnchor.constraint(equalToConstant: 50)
            ])
            
            coinImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                coinImage.topAnchor.constraint(equalTo: self.view.topAnchor,constant: coinPlacement),
                coinImage.trailingAnchor.constraint(equalTo:cointext.leadingAnchor,constant: -0),
                coinImage.heightAnchor.constraint(equalToConstant: 35),
                coinImage.widthAnchor.constraint(equalToConstant: 35)
            ])
            
            coinAdd.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                coinAdd.centerYAnchor.constraint(equalTo: coinImage.centerYAnchor),
                coinAdd.trailingAnchor.constraint(equalTo:coinImage.leadingAnchor,constant: -5),
                coinAdd.heightAnchor.constraint(equalToConstant: 18),
                coinAdd.widthAnchor.constraint(equalToConstant: 18)
            ])
            
            background.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                background.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -5),
                background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 5),
                background.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 5),
                background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -5)
            ])
            
            let stack  = UIStackView(arrangedSubviews: [Easy,Medium,Hard])
            stack.alignment = .center
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.spacing = 20
            self.view.addSubview(stack)
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stack.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -40),
                stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 40),
                stack.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.43),
                stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        }
        
        @objc func noCoins() {
            let alert = UIAlertController(title: "You Don't Have Enough Coins.", message: "You Dont Have Coins to Unlock this Difficulty.Solve Some Math & try Again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
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
            self.present(alert, animated: true, completion: nil)
        }
        
}


