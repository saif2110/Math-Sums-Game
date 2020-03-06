//
//  RightAnswerVC.swift
//  Math Sums Game
//
//  Created by Abhisar Bhatnagar on 28/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import SwiftFireworks
import SwiftySound

class RightAnswerVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        self.view.addSubview(areYouReady)
        contriant()
        
        if difficulty == "Easy"{
            UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() + 5)
        }else if difficulty == "Medium"{
            UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() + 25)
        }else{
            UserDefaults.standard.setCoins(value: UserDefaults.standard.getCoins() + 35)
        }

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Sound.play(file: "firework.mp3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                Sound.play(file: "firework.mp3")
            }
            for _ in (0...40){
                SwiftFireworks.sharedInstance.showFirework(inView: self.view,andPosition: CGPoint(x:Int(arc4random()%1000),y:Int(arc4random()%1000)))
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.dismiss(animated: true) {
              let appDelegate = UIApplication.shared.delegate as! AppDelegate
              appDelegate.window?.rootViewController = GameEngViewController()
            }
        }
    }
    
    lazy var background:UIImageView = {
        let background = UIImageView()
        background.image = bgImage
        return background
    }()
    
    lazy var areYouReady:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Your Answer is Correct !!!"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 45)
        return label
    }()
    
    
    func contriant(){
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -5),
            background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 5),
            background.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 5),
            background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -5)
        ])
        
        areYouReady.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            areYouReady.topAnchor.constraint(equalTo: self.view.topAnchor),
            areYouReady.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
            areYouReady.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            areYouReady.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
    }
}
