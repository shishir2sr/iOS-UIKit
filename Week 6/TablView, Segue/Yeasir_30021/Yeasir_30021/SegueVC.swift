//
//  SegueVC.swift
//  Yeasir_30021
//
//  Created by bjit on 6/12/22.
//

import UIKit

class SegueVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var segueTitle: UILabel!
    
    @IBOutlet weak var segueSubTitle: UILabel!
    
    
    @IBOutlet weak var segueDescription: UILabel!
    
    var imageName: UIImage?
    var labelTitle: String?
    var labelSubTitle: String?
    var labelDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageName
        segueTitle.text = labelTitle
        segueSubTitle.text = labelSubTitle
        segueDescription.text = labelDescription
    }
    
}
