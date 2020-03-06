//
//  EasyMidHardView.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 27/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit

class EasyMidHardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCusatomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDifficulty(title:String){
        self.difficulty.text = title
    }
    
    func updateCoinslabel(title:String){
        self.coinsLabel.text = title
    }
    
    func addCusatomView() {
        self.addSubview(ImageVW)
        ImageVW.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ImageVW.topAnchor.constraint(equalTo: self.topAnchor),
            ImageVW.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            ImageVW.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ImageVW.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        ImageVW.addSubview(difficulty)
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            difficulty.topAnchor.constraint(equalTo: ImageVW.topAnchor,constant: 15),
            difficulty.trailingAnchor.constraint(equalTo:ImageVW.trailingAnchor),
            difficulty.leadingAnchor.constraint(equalTo: ImageVW.leadingAnchor),
            difficulty.heightAnchor.constraint(equalTo: ImageVW.heightAnchor, multiplier: 0.3)
        ])
        
        ImageVW.addSubview(coinsLabel)
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinsLabel.bottomAnchor.constraint(equalTo: ImageVW.bottomAnchor,constant: -15),
            coinsLabel.trailingAnchor.constraint(equalTo:ImageVW.trailingAnchor),
            coinsLabel.leadingAnchor.constraint(equalTo: ImageVW.leadingAnchor),
            coinsLabel.heightAnchor.constraint(equalTo: ImageVW.heightAnchor, multiplier: 0.2)
        ])
        
    }
    
    lazy var ImageVW:UIImageView = {
        let ImageVW = UIImageView()
        ImageVW.image = #imageLiteral(resourceName: "bloc.png")
        ImageVW.contentMode = .scaleToFill
        return ImageVW
    }()
    
    lazy var difficulty:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "mainDifficulty"
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 35)
        return label
    }()

    
    lazy var coinsLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.init(name: "DKCrayonCrumble", size: 20)
        return label
    }()
    
}
