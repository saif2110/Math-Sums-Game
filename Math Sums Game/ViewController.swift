//
//  ViewController.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 25/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    
    @objc func additionPressed(){
        mathType = "Addition"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func SubstactionbuttonPressed(){
         mathType = "Substraction"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func MultiplicationbuttonPressed(){
        mathType = "Multiplication"
        let vc = SelectLevel()
        self.present(vc, animated: true, completion: nil)
    }
    @objc func DivisionbuttonPressed(){
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
        button.setBackgroundImage(#imageLiteral(resourceName: "yellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("+ Addition", for: .normal)
        return button
    }()
    
    lazy var Substactionbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "yellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("- Subtraction", for: .normal)
        
        return button
    }()
    
    lazy var Multiplicationbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "yellow"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("× Multiplication", for: .normal)
        return button
    }()
    
    lazy var Divisionbutton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "yellow"), for: .normal)
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
    
    
    func contriant(){
        gameTitel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameTitel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 50),
            gameTitel.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -20),
            gameTitel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            gameTitel.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.15)
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
            stack.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.15),
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

