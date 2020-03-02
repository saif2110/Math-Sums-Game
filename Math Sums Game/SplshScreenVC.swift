//
//  SplshScreenVC.swift
//  Math Sums Game
//
//  Created by Abhisar Bhatnagar on 02/03/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class SplshScreenVC: UIViewController {

    @IBOutlet weak var imageGIF: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageGIF.loadGif(name: "loder")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            secondVC.modalPresentationStyle = .fullScreen
            self.present(secondVC, animated: true, completion: nil)
        }
        
    }
    

    

}
