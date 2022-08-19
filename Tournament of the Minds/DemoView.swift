//
//  DemoView.swift
//  Tournament of the Minds
//
//  Created by David Mazzeo on 10/8/2022.
//

import UIKit
import QuickLook

var previewItem = NSURL()

class DemoView: ViewController {
    
    @IBOutlet weak var nuggetImage: UIImageView!
    
    @objc func displayAR() {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewItem = self.getPreviewItem(withName: "untitled.usdz")
        self.present(previewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(displayAR))
        nuggetImage.addGestureRecognizer(tapRecognizer)
        
    }
    
    func getPreviewItem(withName name: String) -> NSURL {
        let file = name.components(separatedBy: ".")
        let path = Bundle.main.path (forResource: file.first!, ofType: file.last!)
        let url = NSURL(fileURLWithPath: path!)
        return url
    }
    
}

extension ViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return previewItem as QLPreviewItem
    }
}
