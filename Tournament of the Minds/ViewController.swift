//
//  ViewController.swift
//  Tournament of the Minds
//
//  Created by David Mazzeo on 26/7/2022.
//

import UIKit

public protocol MicrobitUIDelegate {
    func startScanning()
    func stopScanning()
    func disconnect()
    func uartSend(message:String)
    func pinSetfor(read:[UInt8:Bool])
    func pinSetfor(analogue:[UInt8:Bool])
    func pinWrite(value:[UInt8:UInt8])
    func event(register:[Int16])
    func raiseEvent(event:MicrobitEvent,value:UInt16)
}

public var delegate:MicrobitUIDelegate?
class ViewController: UIViewController {
    
    @IBOutlet weak var connectOutlet: UIButton!
    
    @IBAction func connectButton(_ sender: Any) {
        delegate?.startScanning()
        
        connectOutlet.layer.shadowOffset = .zero
        connectOutlet.layer.shadowColor = UIColor.systemBlue.cgColor
        connectOutlet.layer.shadowRadius = 20
        connectOutlet.layer.shadowPath = UIBezierPath(rect: connectOutlet.bounds).cgPath
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

