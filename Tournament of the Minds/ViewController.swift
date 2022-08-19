//
//  ViewController.swift
//  Tournament of the Minds
//
//  Created by David Mazzeo on 26/7/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var connectOutlet: UIButton!
    @IBOutlet weak var connectedItems: UILabel!
    
    @IBAction func connectButton(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            UIButton.animate(withDuration: 0.5, animations: {
                self.connectOutlet.layer.shadowOpacity = 1
            }, completion: { finish in
                UIButton.animate(withDuration: 0.5, animations: {
                    self.connectOutlet.layer.shadowOpacity = 0
                })
            })
        }
        
        UIButton.animate(withDuration: 0.2, animations: {
            self.connectOutlet.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { finish in
            UIButton.animate(withDuration: 0.2, animations: {
                self.connectOutlet.transform = CGAffineTransform.identity
            })
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // needs delay to work
//        connectOutlet.layer.shadowOffset = .zero
//        connectOutlet.layer.shadowColor = UIColor.systemGreen.cgColor
//        connectOutlet.layer.shadowRadius = 20
//        connectOutlet.layer.shadowPath = UIBezierPath(rect: connectOutlet.bounds).cgPath
        
    }


}

