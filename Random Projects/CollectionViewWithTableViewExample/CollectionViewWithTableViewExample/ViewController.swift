import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250  }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieData.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let headerTitle = movieData[section].movieType
        
        return headerTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath) as! MovieTableViewCell
        cell.movieCollectionView.tag = indexPath.section
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
}



