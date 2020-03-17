//
//  Likedislikepop.swift
//  Math Sums Game
//
//  Created by Junaid Mukadam on 17/03/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import Foundation

class Likedislikepop: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.0602990165, green: 0.0602990165, blue: 0.0602990165, alpha: 0.5)
        addCusatomView()
    }
    
    override func layoutSubviews() {
        likeemoji.clipsToBounds = true
        likeemoji.layer.cornerRadius = likeemoji.bounds.size.width / 2
        
        dislike.clipsToBounds = true
        dislike.layer.cornerRadius = dislike.bounds.size.width / 2
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var coinsLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9860940735, green: 1, blue: 0.9911256634, alpha: 1)
        label.text = "Would You Please Rate us 5 Stars ?"
        label.font  = UIFont.init(name: "Hoefler Text", size: 20)
        return label
    }()
    
    lazy var line:UIView = {
        let label = UIView()
        label.backgroundColor =  #colorLiteral(red: 0.7650697969, green: 0.7650697969, blue: 0.7650697969, alpha: 1)
        return label
    }()
    
    lazy var line2:UIView = {
        let label = UIView()
        label.backgroundColor =  #colorLiteral(red: 0.7650697969, green: 0.7650697969, blue: 0.7650697969, alpha: 1)
        return label
    }()
    lazy var line3:UIView = {
        let label = UIView()
        label.backgroundColor =  #colorLiteral(red: 0.7650697969, green: 0.7650697969, blue: 0.7650697969, alpha: 1)
        return label
    }()
    
    lazy var whiteView:UIImageView = {
        let label = UIImageView()
        label.image = #imageLiteral(resourceName: "bg")
        label.backgroundColor =  #colorLiteral(red: 0.9686706853, green: 0.9686706853, blue: 0.9686706853, alpha: 1)
        return label
    }()
    
    lazy var likeemoji:UILabel = {
        let label = UILabel()
        label.text = "👍"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor =  #colorLiteral(red: 0.7828933982, green: 0.8862745166, blue: 0.7046857251, alpha: 1)
        return label
    }()
    
    
    lazy var dislike:UILabel = {
        let label = UILabel()
        label.text = "👎"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor =  #colorLiteral(red: 0.9098039269, green: 0.7442120744, blue: 0.8460278749, alpha: 1)
        return label
    }()
    
    lazy var likeClick:UIButton = {
        let label = UIButton()
        label.titleLabel?.font = UIFont.init(name: "Hoefler Text", size: 17)
        label.setTitleColor(UIColor.white, for: .normal)
        label.setTitle("Yes. I Will Do", for: .normal)
        return label
    }()
    
    lazy var DislikeClick:UIButton = {
        let label = UIButton()
        label.titleLabel?.font = UIFont.init(name: "Hoefler Text", size: 17)
        label.setTitleColor(UIColor.white, for: .normal)
        label.setTitle("No Thanks", for: .normal)
        return label
    }()
    
    lazy var remideMe:UIButton = {
        let label = UIButton()
        label.titleLabel?.font = UIFont.init(name: "Hoefler Text", size: 12)
        label.setTitleColor(UIColor.lightGray, for: .normal)
        label.setTitle("Remind Me Later", for: .normal)
        return label
    }()
    
    
    func addCusatomView() {
        whiteView.clipsToBounds = true
        whiteView.layer.cornerRadius = 10
        
        whiteView.isUserInteractionEnabled = true
        self.addSubview(whiteView)
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whiteView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.35),
            whiteView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.85),
            whiteView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            whiteView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        whiteView.addSubview(coinsLabel)
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinsLabel.topAnchor.constraint(equalTo: whiteView.topAnchor,constant: 10),
            coinsLabel.trailingAnchor.constraint(equalTo:whiteView.trailingAnchor,constant: -10),
            coinsLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 10),
            coinsLabel.heightAnchor.constraint(equalTo: whiteView.heightAnchor,multiplier:0.25)
        ])
        
        whiteView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: coinsLabel.bottomAnchor,constant: 10),
            line.trailingAnchor.constraint(equalTo:whiteView.trailingAnchor,constant: -0),
            line.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 0),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        whiteView.addSubview(likeemoji)
        likeemoji.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeemoji.topAnchor.constraint(equalTo: line.bottomAnchor,constant: 8),
            likeemoji.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 10),
            likeemoji.heightAnchor.constraint(equalToConstant: 40),
            likeemoji.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        whiteView.addSubview(likeClick)
        likeClick.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeClick.topAnchor.constraint(equalTo: line.bottomAnchor,constant: 0),
            likeClick.leadingAnchor.constraint(equalTo: likeemoji.leadingAnchor,constant: 10),
            likeClick.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor,constant: -10),
            likeClick.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        whiteView.addSubview(line2)
        line2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line2.topAnchor.constraint(equalTo: likeClick.bottomAnchor,constant: 0),
            line2.trailingAnchor.constraint(equalTo:whiteView.trailingAnchor,constant: 0),
            line2.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 50),
            line2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        whiteView.addSubview(dislike)
        dislike.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dislike.topAnchor.constraint(equalTo: line2.bottomAnchor,constant: 5),
            dislike.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 10),
            dislike.heightAnchor.constraint(equalToConstant: 40),
            dislike.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        whiteView.addSubview(DislikeClick)
        DislikeClick.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            DislikeClick.topAnchor.constraint(equalTo: line2.bottomAnchor,constant: 0),
            DislikeClick.leadingAnchor.constraint(equalTo: dislike.leadingAnchor,constant: 15),
            DislikeClick.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor,constant: -10),
            DislikeClick.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        whiteView.addSubview(line3)
        line3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line3.topAnchor.constraint(equalTo: dislike.bottomAnchor,constant: 8),
            line3.trailingAnchor.constraint(equalTo:whiteView.trailingAnchor,constant: -0),
            line3.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 0),
            line3.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        whiteView.addSubview(remideMe)
        remideMe.isUserInteractionEnabled = true
        remideMe.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            remideMe.topAnchor.constraint(equalTo: line3.bottomAnchor,constant: 10),
            remideMe.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            remideMe.widthAnchor.constraint(equalToConstant: 100),
            remideMe.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
