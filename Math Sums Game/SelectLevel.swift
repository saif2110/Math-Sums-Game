//
//  SelectLevel.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 25/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit

class SelectLevel: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        view.addSubview(gameTitel)
        contriant()
        Easy.addTarget(self, action: #selector(easyPressed), for: .touchUpInside)
    }
    
    @objc func easyPressed() {
        let vc = GameEngViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    lazy var background:UIImageView = {
        let background = UIImageView()
        background.image = bgImage
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
    
    lazy var Easy:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "bloc"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Chalkduster", size: buttonFontSize)
        button.setTitle("", for: .normal)
        return button
    }()
    
    lazy var Medium:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "bloc"), for: .normal)
        return button
    }()
    
    lazy var Hard:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "bloc"), for: .normal)
        return button
    }()
    
    func contriant(){
        gameTitel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameTitel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 40),
            gameTitel.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: -20),
            gameTitel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            gameTitel.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.15)
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
}
