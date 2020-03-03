//
//  GameEngViewController.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 26/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit

var difficulty = "Easy"
var mathType = ""

class GameEngViewController: UIViewController {
    var result = 0
    var resultArray = [Int]()
    var counter = 15
    var type = "Addition"
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        type = mathType
        self.view.addSubview(background)
        self.view.addSubview(areYouReady)
        self.view.addSubview(questonLabel)
        optionsFORarray()
        contriantoFbackGround()
        cointext.text = String(UserDefaults.standard.getCoins())
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { //1
            self.areYouReady.removeFromSuperview()
            self.constrainofQuestion()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    @objc func updateCounter() {
        if counter >= -1 {
            Time.text = String(counter)
            if counter <= 10 && counter >= 5{
                Time.textColor = .orange
            }else if counter <= 5 && counter > 0{
                Time.textColor = .red
            }else if counter == 0 {
                counter = 15
                timer.invalidate()
                resoneforLosss = "Sorry, Your Time is Over 😔"
                self.dismiss(animated: false) {
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = WrongAnswerVC()
                }
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
    
    
    lazy var Time:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "15"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 65)
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
    
    
    var a = Int.random(in: 1...9)
    var b = Int.random(in: 1...9)
    
    func question() -> String {
        questionRange()
        if type == "Addition"{
            result = a + b
            answerWas = String(result)
            return String(a) + " + " + String(b) + " = ??"
        }else if type == "Substraction"{
            result = a - b
            answerWas = String(result)
            return String(a) + " - " + String(b) + " = ??"
        }else if type == "Multiplication"{
            result = a * b
            answerWas = String(result)
            return String(a) + " × " + String(b) + " = ??"
        }else{
            result = a / b
            answerWas = String(result)
            return String(a) + " ÷ " + String(b) + " = ??"
        }
    }
    
    
    func questionRange(){
        if type == "Addition"{
            
            if difficulty == "Hard"{
                
                a = Int.random(in: 100...899)
                b = Int.random(in: 100...899)
                
            }else if difficulty == "Medium"{
                
                a = Int.random(in: 10...89)
                b = Int.random(in: 10...89)
                
            }else{
                a = Int.random(in: 1...9)
                b = Int.random(in: 1...9)
            }
            
        }else if type == "Substraction" {
            
            if difficulty == "Hard"{
                
                a = Int.random(in: 100...899)
                b = Int.random(in: 100...899)
                
            }else if difficulty == "Medium"{
                
                a = Int.random(in: 10...89)
                b = Int.random(in: 10...89)
                
            }else{
                a = Int.random(in: 1...9)
                b = Int.random(in: 1...9)
            }
            
        }else if type == "Multiplication"{
            
            if difficulty == "Hard"{
                
                a = Int.random(in: 10...99)
                b = Int.random(in: 10...99)
                
            }else if difficulty == "Medium"{
                
                a = Int.random(in: 10...30)
                b = Int.random(in: 1...9)
                
            }else{
                a = Int.random(in: 1...9)
                b = Int.random(in: 1...9)
            }
            
        }else if type == "Division"{
            
            if difficulty == "Hard"{
                repeat{
                    a = evenNumberFinder(firstRange: 499, lastRange: 999)
                    b = evenNumberFinder(firstRange: 100, lastRange: 799)
                }while a % b != 0
            }else if difficulty == "Medium"{
                
                repeat{
                    a = evenNumberFinder(firstRange: 200, lastRange: 400)
                    b = evenNumberFinder(firstRange: 11, lastRange: 299)
                }while a % b != 0
                
            }else{
                repeat{
                    a = evenNumberFinder(firstRange: 1, lastRange: 60)
                    b = evenNumberFinder(firstRange: 1, lastRange: 60)
                }while a % b != 0
            }
        }
    }
    
    func evenNumberFinder(firstRange:Int,lastRange:Int) -> Int{
        var num:Int!
        repeat {
            num = Int.random(in: firstRange...lastRange)
        }while num % 2 != 0
        return num
    }
    
    func optionsFORarray(){
        repeat {
            let a = Int.random(in: -1...4)
            resultArray.append(result + a)
            resultArray = Array(Set(resultArray))
            resultArray = resultArray.filter { $0 != result }
        } while resultArray.count <= 1;
        resultArray.append(result)
        resultArray.append(result+10)
        resultArray.shuffle()
    }
    
    func contriantoFbackGround(){
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
    
    
    func constrainofQuestion(){
        
        view.addSubview(Time)
        Time.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Time.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 35),
            Time.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            Time.heightAnchor.constraint(equalToConstant: 60),
            Time.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.3)
        ])
        
        
        view.addSubview(coinImage)
        view.addSubview(cointext)
        view.addSubview(coinAdd)
        
        cointext.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cointext.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 25),
            cointext.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -10),
            cointext.heightAnchor.constraint(equalToConstant: 35),
            cointext.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 25),
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
        timer.invalidate()
        if  rightorWronmg(ButText: AnsButton1.titleLabel!.text!) {
            self.dismiss(animated: false) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = RightAnswerVC()
            }
        }else{
            self.dismiss(animated: false) {
                resoneforLosss = "Sorry, Your Answer is Wrong 😔"
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = WrongAnswerVC()
            }
        }
    }
    
    @objc func Ans2(){
        timer.invalidate()
        if  rightorWronmg(ButText: AnsButton2.titleLabel!.text!) {
            self.dismiss(animated: false) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = RightAnswerVC()
            }
        }else{
            self.dismiss(animated: false) {
                resoneforLosss = "Sorry, Your Answer is Wrong 😔"
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = WrongAnswerVC()
            }
        }
        
    }
    
    @objc func Ans3(){
        timer.invalidate()
        if  rightorWronmg(ButText: AnsButton3.titleLabel!.text!) {
            self.dismiss(animated: false) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = RightAnswerVC()
            }
        }else{
            self.dismiss(animated: false) {
                resoneforLosss = "Sorry, Your Answer is Wrong 😔"
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = WrongAnswerVC()
            }
        }
        
    }
    
    @objc func Ans4(){
        timer.invalidate()
        if  rightorWronmg(ButText: AnsButton4.titleLabel!.text!) {
            self.dismiss(animated: false) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = RightAnswerVC()
            }
        }else{
            self.dismiss(animated: false) {
                resoneforLosss = "Sorry, Your Answer is Wrong 😔"
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = WrongAnswerVC()
            }
        }
        
    }
    
    func rightorWronmg(ButText:String) -> Bool{
        if ButText == String(result){
            return true
        }else{
            return false
        }
    }
    
}
