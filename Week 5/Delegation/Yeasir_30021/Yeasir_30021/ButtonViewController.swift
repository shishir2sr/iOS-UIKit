//
//  ButtonViewController.swift
//  Yeasir_30021
//
//  Created by bjit on 2/12/22.
//

import UIKit
class ButtonViewController: UIViewController {
    
    var delegate: ImageViewContorllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func editTheImage(_ sender: UIButton) {
        delegate?.changeUiImage(imageName: UIImage(named: "illusion")!)
        self.dismiss(animated: true)
        
    }
    
    
    @IBAction func ssecondButton(_ sender: UIButton) {
        
        delegate?.changeUiImage(imageName: UIImage(named: "o-illusion")!)
        print("editImage button pressed")
        self.dismiss(animated: true)
    }
}
