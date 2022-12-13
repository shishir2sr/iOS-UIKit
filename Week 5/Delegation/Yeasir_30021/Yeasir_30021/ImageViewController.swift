
/**
# ImageViewController.swift
# Yeasir_30021
*/

import UIKit

protocol ImageViewContorllerDelegate{
    func changeUiImage(imageName: UIImage)
}


class ImageViewController: UIViewController, ImageViewContorllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainViewControllerToSecondViewController"{
            if let buttonViewController = segue.destination as? ButtonViewController {
                buttonViewController.delegate = self
            }
        }
    }
    
    // Came from protocol
    func changeUiImage(imageName: UIImage) {
        imageView.image = imageName
    }
}
