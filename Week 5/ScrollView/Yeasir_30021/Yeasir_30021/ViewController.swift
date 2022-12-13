//
//  ViewController.swift
//  Yeasir_30021
//
//  Created by bjit on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appendTextField: UITextField!
    
    @IBOutlet weak var showText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func appendButtonPressed(_ sender: UIButton) {
        guard case appendTextField.text = appendTextField.text else{
            return
        }
        
        showText.text = showText.text! + appendTextField.text!
        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        showText.text = ""
    }
}

