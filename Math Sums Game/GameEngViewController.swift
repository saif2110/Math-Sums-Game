//
//  GameEngViewController.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 26/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit

class GameEngViewController: UIViewController {
    var result = 0
    var resultArray = [Int]()
    var counter = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        self.view.addSubview(areYouReady)
        self.view.addSubview(questonLabel)
        optionsFORarray()
        contriantoFbackGround()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { //3
            self.areYouReady.removeFromSuperview()
            self.constrainofQuestion()
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateCounter() {
        if counter >= 0 {
            Time.text = String(counter)
            if counter <= 10 && counter >= 5{
                Time.textColor = .orange
            }else if counter <= 5 && counter >= 0{
                Time.textColor = .red
            }else{
                Time.textColor = .white
            }
            counter -= 1
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
        label.text = "Are You Ready ??"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 45)
        return label
    }()
    
    
    lazy var level:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Level 1/30"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 25)
        return label
    }()
    
    
    lazy var Time:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "15"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 65)
        return label
    }()
    
    lazy var score:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.text = "Score 0"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 25)
        return label
    }()
    
    
    lazy var questonLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = question()
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 60)
        return label
    }()
    
    lazy var AnsButton1:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "ansBut"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: 30)
        button.setTitle(String(resultArray[0]), for: .normal)
        return button
    }()
    
    lazy var AnsButton2:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "ansBut"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: 30)
        button.setTitle(String(resultArray[1]), for: .normal)
        return button
    }()
    
    lazy var AnsButton3:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "ansBut"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: 30)
        button.setTitle(String(resultArray[2]), for: .normal)
        return button
    }()
    
    lazy var AnsButton4:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "ansBut"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: 30)
        button.setTitle(String(resultArray[3]), for: .normal)
        return button
    }()
    
    
    func question() -> String {
        let a = Int.random(in: 1...9)
        let b = Int.random(in: 1...9)
        result = a + b
        return String(a) + " + " + String(b) + " = ??"
    }
    
    func optionsFORarray(){
        repeat {
            let a = Int.random(in: -1...4)
            resultArray.append(result + a)
            resultArray = Array(Set(resultArray))
            resultArray = resultArray.filter { $0 != result}
            
        } while resultArray.count <= 2;
        resultArray.append(result)
        resultArray.shuffle()
      
    }
    
    
    
    
    func contriantoFbackGround(){
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([    background.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -5),
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
    
    func constrainofQuestion(){
        
        view.addSubview(level)
        level.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            level.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 30),
            level.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 50),
            level.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.15),
            level.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.3)
        ])
        
        view.addSubview(Time)
        Time.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Time.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 35),
            Time.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            Time.heightAnchor.constraint(equalToConstant: 60),
            Time.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.3)
        ])
        
        view.addSubview(score)
        score.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            score.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 30),
            score.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -50),
            score.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.15),
            score.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.3)
        ])
        
        
        view.addSubview(questonLabel)
        questonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questonLabel.topAnchor.constraint(equalTo: Time.bottomAnchor),
            questonLabel.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
            questonLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            questonLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.25)
        ])
        
        
        let stack  = UIStackView(arrangedSubviews: [AnsButton1,AnsButton2,AnsButton3,AnsButton4])
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 40
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: questonLabel.bottomAnchor,constant: 10),
            stack.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -50),
            stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 50),
            stack.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.2)
        ])
        
        AnsButton1.addTarget(self, action: #selector(Ans1), for: .touchUpInside)
        AnsButton2.addTarget(self, action: #selector(Ans2), for: .touchUpInside)
        AnsButton3.addTarget(self, action: #selector(Ans3), for: .touchUpInside)
        AnsButton4.addTarget(self, action: #selector(Ans4), for: .touchUpInside)
        
    }
    
    @objc func Ans1(){
        print(rightorWronmg(ButText: AnsButton1.titleLabel!.text!))
    }
    
    @objc func Ans2(){
        print(rightorWronmg(ButText: AnsButton2.titleLabel!.text!))
    }
    
    @objc func Ans3(){
        print(rightorWronmg(ButText: AnsButton3.titleLabel!.text!))
    }
    
    @objc func Ans4(){
        print(rightorWronmg(ButText: AnsButton4.titleLabel!.text!))
    }
    
    func rightorWronmg(ButText:String) -> Bool{
        if ButText == String(result){
            return true
        }else{
            return false
        }
    }
    
}
