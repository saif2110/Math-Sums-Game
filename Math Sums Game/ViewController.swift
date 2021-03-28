//
//  ViewController.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 25/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import GoogleMobileAds
import SwiftySound

class ViewController: UIViewController {
    var isADdisplayed = false
    
    var rewardedAd: GADRewardedAd?
    func loadandShowRewardedAd() {
        
        let request = GADRequest()
        GADRewardedAd.load(
            withAdUnitID: testVideoad,
            request: request,
            completionHandler: { ad, error in
                if error != nil {
                    
                    return
                }
                self.rewardedAd = ad
                
                if self.rewardedAd != nil {
                    self.rewardedAd!.present(
                        fromRootViewController: self,
                        userDidEarnRewardHandler: {
                            UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() + 70)
                            self.cointext.text = String(UserDefaults.standard.getCoins())
                            
                        })
                }
            })
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gameTitel)
        backgroundImage.image = bgImage
        view.addSubview(Soundbut)
        contriant()
        Additionbutton.addTarget(self, action: #selector(additionPressed), for: .touchUpInside)
        Substactionbutton.addTarget(self, action: #selector(SubstactionbuttonPressed), for: .touchUpInside)
        Multiplicationbutton.addTarget(self, action: #selector(MultiplicationbuttonPressed), for: .touchUpInside)
        Divisionbutton.addTarget(self, action: #selector(DivisionbuttonPressed), for: .touchUpInside)
        cointext.text = String(UserDefaults.standard.getCoins())
        Soundbut.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
        coinAdd.addTarget(self, action: #selector(showAdpopUP), for: .touchUpInside)
        
        if CountNumberofTimesAppOpen() > 4 {
            rateApp()
        }
        
        if !isADdisplayed {
            ShowIntrestAd(selfo:self,showAdafterSecound:2)
            isADdisplayed = true
        }
    }
    
    @objc func easyPressed(sender: UIGestureRecognizer){
        if sender.name == "remideMe" {
            LikeView.removeFromSuperview()
        }else if sender.name == "likeClick" {
            rateApp()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.LikeView.removeFromSuperview()
            }
            UserDefaults.standard.setisRated(value: true)
        }else{
            LikeView.removeFromSuperview()
        }
    }
    
    lazy var LikeView:Likedislikepop = {
        let button = Likedislikepop(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        return button
    }()
    
    @objc func showAdpopUP(){
        
        let alert = UIAlertController(title: "WATCH A VIDEO", message: "Add 70 Coins by Watching a Video", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "WATCH", style: .default, handler: { action in
                   switch action.style{
                   case .default:
                    self.loadandShowRewardedAd()
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
       
        self.present(alert, animated: true, completion: nil)
        
    }

    @objc func soundPressed(){
        if Soundbut.imageView?.image == #imageLiteral(resourceName: "Sound"){
            UserDefaults.standard.setisbackGroundSoundOn(value: false)
            Soundbut.setImage(#imageLiteral(resourceName: "redSoundOFF"), for: .normal)
            NotificationCenter.default.post(name:NSNotification.Name("sound"),object: nil)
        }else{
            UserDefaults.standard.setisbackGroundSoundOn(value: true)
            Soundbut.setImage(#imageLiteral(resourceName: "Sound"), for: .normal)
            NotificationCenter.default.post(name:NSNotification.Name("sound"),object: nil)
        }
    }
    
    @objc func additionPressed(){
        Sound.play(file: "pop.mp3")
        mathType = "Addition"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func SubstactionbuttonPressed(){
        Sound.play(file: "pop.mp3")
        mathType = "Substraction"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func MultiplicationbuttonPressed(){
        Sound.play(file: "pop.mp3")
        mathType = "Multiplication"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func DivisionbuttonPressed(){
        Sound.play(file: "pop.mp3")
        mathType = "Division"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    
    lazy var gameTitel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = gameName
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 45) //Chalkduster DKCrayonCrumble
        return label
    }()
    
    lazy var Additionbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "curveYellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("+ Addition", for: .normal)
        return button
    }()
    
    lazy var Substactionbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "curveYellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize-3)
        button.setTitle("- Subtraction", for: .normal)
        
        return button
    }()
    
    lazy var Multiplicationbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "curveYellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize-3)
        button.setTitle("× Multiplication", for: .normal)
        return button
    }()
    
    lazy var Divisionbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "curveYellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("÷ Division", for: .normal)
        return button
    }()
    
    lazy var Leaderbut:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Leader"), for: .normal)
        return button
    }()
    
    lazy var Soundbut:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Sound"), for: .normal)
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
        gameTitel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameTitel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 50),
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
        
        let stack  = UIStackView(arrangedSubviews: [Additionbutton,Substactionbutton,Multiplicationbutton,Divisionbutton])
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -40),
            stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 40),
            stack.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.20),
            stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        Soundbut.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Soundbut.heightAnchor.constraint(equalToConstant: 50),
            Soundbut.widthAnchor.constraint(equalToConstant: 50),
            Soundbut.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -35),
            Soundbut.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0)
        ])
    }
}
