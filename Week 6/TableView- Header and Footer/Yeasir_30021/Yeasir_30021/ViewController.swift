

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "MyHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "MyHeaderView")
        
    }

}




extension  ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerAndFooter(imageId: "hero", titleText: "Header 1: Yeasir Arefin Tusher", subtitleText: "tusher@yeasirarefin.com")
        }
        
         return headerAndFooter(imageId: "hero", titleText: "Header 2: Yeasir Arefin Tusher", subtitleText: "tusher@yeasirarefin.com")
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            let footer = headerAndFooter(imageId: "tusher", titleText: "Footer 1: Yeasir Arefin Tusher", subtitleText: "tusher@yeasirarefin.com")
            
             return footer
        }
        
         return headerAndFooter(imageId: "tusher", titleText: "Footer 2: Yeasir Arefin Tusher", subtitleText: "tusher@yeasirarefin.com")
    }
    
    // MARK: Function for Header and Footer
    func headerAndFooter( imageId: String, titleText: String, subtitleText: String) -> UITableViewHeaderFooterView{
        var myHeaderFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyHeaderView") as! MyHeaderView
        myHeaderFooter.headerImage.image = UIImage(named: imageId)
        myHeaderFooter.headerTitle.text = titleText
        myHeaderFooter.headerSubTitle.text = subtitleText
        
        return myHeaderFooter
    }
    
    // Height for header and footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    
    // number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvcell", for: indexPath)
        cell.textLabel?.text = "Header and footer practise"
        return cell
    }
    
    
    
}



