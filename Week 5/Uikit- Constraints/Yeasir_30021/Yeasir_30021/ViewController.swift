
/**__Yeasir_30021__*/
//  Created by bjit on 28/11/22.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func redButtonPressed(_ sender: UIButton) {
        displayText.text = "Red"
        displayText.textColor = UIColor.red
    }
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        displayText.text = "Blue"
        displayText.textColor = UIColor.blue
    }
    
    @IBAction func yellowButtonPressed(_ sender: UIButton) {
        displayText.text = "Yellow"
        displayText.textColor = UIColor.yellow
    }
    
}

