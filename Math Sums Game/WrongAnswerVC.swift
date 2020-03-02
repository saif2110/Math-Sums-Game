//
//  WrongAnswerVC.swift
//  Math Sums Game
//
//  Created by Abhisar Bhatnagar on 28/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
var resoneforLosss = "Sorry, Your Answer is Wrong 😔"
class WrongAnswerVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        self.view.addSubview(sorryLabel)
        self.view.addSubview(ansWas)
        contriant()
        backToMainMenu.addTarget(self, action: #selector(backtoMain), for: .touchUpInside)
        playAgain.addTarget(self, action: #selector(playAgainPressed), for: .touchUpInside)
    }
    
    @objc func playAgainPressed() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dismiss(animated: true) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = GameEngViewController()
            }
        }
    }
    
    
    @objc func backtoMain() {
        self.dismiss(animated: false) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signInViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(signInViewController, animated: false, completion: nil)        }
    }
    
    lazy var background:UIImageView = {
        let background = UIImageView()
        background.image = bgImage
        return background
    }()
    
    lazy var sorryLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = resoneforLosss
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 40)
        return label
    }()
    
    lazy var ansWas:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Correct Answer Was " + answerWas
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 35)
        return label
    }()
    
    lazy var backToMainMenu:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "yellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("Back to Menu", for: .normal)
        return button
    }()
    
    lazy var playAgain:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "yellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("Play Again", for: .normal)
        return button
    }()
    
    func contriant(){
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -5),
            background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 5),
            background.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 5),
            background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -5)
        ])
        
        sorryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sorryLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 20),
            sorryLabel.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
            sorryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sorryLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.4)
        ])
        
        ansWas.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ansWas.topAnchor.constraint(equalTo: sorryLabel.bottomAnchor),
            ansWas.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
            ansWas.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            ansWas.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.09)
        ])
        
        let stack  = UIStackView(arrangedSubviews: [backToMainMenu,playAgain])
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 40
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -40),
            stack.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -100),
            stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 100),
            stack.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.2)
        ])
        
    }
}
